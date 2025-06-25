Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21F9263F40;
	Wed, 25 Jun 2025 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857179; cv=none; b=NcONgsXzEahTXjQh9Gh6EwsDW7eKHA+N9gIrI5FPyvx+eZTPNN7tuBIWbbMYtWCj9UsmhKaB7LisPALCCpjJMxY0zY3eEz+ffwM0TNwUWfd1+EdN+qdbAAj7PvjRtfPN6rXfa6KyjIMTxKrGRb9321p4W9JcfPAQhI3WWuJI86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857179; c=relaxed/simple;
	bh=c/cs2GvmT9AV9fE3ByodzfHCrxWqxDY8Mw90vyx3za0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqqG3i8N6RNMBw427ddRvSeCIwikM+IwTxYkmGj77Fs4lfuhL33Wf3LVvewbQRP7tTIb7moZrkYzppnzQHBnuGSO1PgzsUVGJiBwq0Z2Shzx3NHJWetJBPRAZm6yJEVpBLU9PqOWL+1Uie7IhmftkwYXK0G4lwJR13+qBf2KWM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agIkpwCI; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agIkpwCI"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fd0a7d3949so26219006d6.0;
        Wed, 25 Jun 2025 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750857175; x=1751461975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7XEAeABBEPfH4dacoEICW2H1x2av1UXnkGOMgIKze4=;
        b=agIkpwCIim1wyxkdGbCtiM7hbSrGwLh2+AJryGVLty3N3u6kglQOvWMg2JA2M620g8
         Gr6WtLm+NTIIGLMIx0nNbW2HBHvWU/zLycUMjd5qQQPayacoDBgaEkKsKYAO7AdTNa3e
         5z3R678wLw8o+8QQ3Tqx1dxF0qVpvUqZzHsVTgAc8WT8WvCCAozWPfkw0jh3UTQvKNip
         Uc2hPiVfk8tIXzUBF3f0hYqQ043vAgh3UdI1PSfjopHjsWsjahUdczTgDVXsxVNkwMdF
         XBjIumD9TsRQPYZbu2OEUUdXkytdCiB/de7sKbvAqUG6jIjlRgMGVX0SCfRuRg8CjFOB
         7Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857175; x=1751461975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7XEAeABBEPfH4dacoEICW2H1x2av1UXnkGOMgIKze4=;
        b=vtnJAqACQLnG+eN6MCjY/gC8pZoFk4kS9Vub41ZHCAxJ1cL4dP6q/f6dmOCAHbUiyO
         VCFRyKxTIPyzNZGUXIWC35O0om43sqGkTLZ/ocruiMM5Nbm0lD+ROERH8bkuARDNTPLw
         pfLv9EzS9FQ7l/oMmQFFkTS8sUddIHF5nAyy4nBjFvjK3RNvPXcu5H9UhcGYpMoP3lkD
         V6U+zcHAImJCv1H1OQEsAr3dkzNb9H3n2VRn5Js1R0/cFhpBfaD+OYoRzWrZRIXqGzMk
         2zavxWhdA+BIz1dw8PApNbgkHgXYheyeNU8ksF5GpUemYA1WSv35/kHONX3qud+r3YOM
         /4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFNckpgjWo4LpMoaumGieVBLWXk8QyxQ7NB5C/hRszbZ7A97wNM6Bbyb4nmy1h3QJikU8Bvup4U4sMPHa8pbQ=@vger.kernel.org, AJvYcCXRdHk8c5bIaakEjaVgIT/0ZZP98evwt+2lLmIRoh2rRRiToWSlvgfghAhX9sqK82MPM0f6+m9IstSA0kA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6u0b3K0oz7F9Rfne8Q1Vh+gjGycRvew8nb+vbr9LsYCugPfsz
	b/PKPz/Lrp56JYZyYw1HOv+w2ci4jQxQy4UcXTiqSnzBQtF774HDYm5+
X-Gm-Gg: ASbGncsBSwc/LED4tLWhOPG7LAy68CAOrCb04Lcsm7s92vnXSRR/8Gg0BbJX3KibWz3
	KvaGRYJShMKjUX8TCa58zj8RqAf/zWDmABWIdg8eAoekvRi94Ie+OjVeFVgV3ai0i6nuXDbNQez
	gfBVTgfUpShBszOs9SozkInt4czwlFiAfHOrptm0Rpzpax+Z5QJ/pL81R2vBQQE/uWjJsCfohkU
	DdATs6JLUrHicX7YaRWDAnp3Pw+P8i13VeNAjgDD6zLvMcwaRIPnzUuI3Zu+Aw58mvCLx3cjcQX
	4ARh9ms/Q4/AJ1C48smoQ+eRBGleaZ1nqK4FrJx80nLmtSWXvuxWkgvw5iNuw1kCeSJS9zeyHMn
	0orG8FoSU8Vw4K5mWAWn9zmVIJYiloRSIvHGyx4iEV5AFw9wSpyac
X-Google-Smtp-Source: AGHT+IEKl2vX+++pejg4hzGpoabiaPqmms6wmMMNyFuJ2l2VDlniu7fykiwNfg3L8xSXuDe+8kTAOQ==
X-Received: by 2002:a05:6214:224a:b0:6fd:5e46:dbc with SMTP id 6a1803df08f44-6fd5ef93451mr41870326d6.33.1750857174972;
        Wed, 25 Jun 2025 06:12:54 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09460830sm67855996d6.51.2025.06.25.06.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:12:54 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id C34BCF40066;
	Wed, 25 Jun 2025 09:12:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Jun 2025 09:12:53 -0400
X-ME-Sender: <xms:1fVbaEW2bUaMgXMhtujBPzqqjoufvObHeN79U66FRD0RXOslzW0GeQ>
    <xme:1fVbaIm1CrTBe2grveDuvabWT28OwTqm-0_QEsEa70j7BDkIm2hS3qKHBNOiSBuRo
    9Dm7--bwCEydRHpfw>
X-ME-Received: <xmr:1fVbaIa5VGfXpehAP6s6qsr01MmbjnGLXyrPV6Y1QSUqvNDwUGAP0Wztfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehvihhtrghlhidrfihoohhlsehkohhnshhulhhkohdrshgvpdhrtghpthhtoheplh
    hinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhig
    qdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehurhgviihkihesghhmrghi
    lhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprhhushhtqdhf
    ohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqh
    hunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:1fVbaDXOLJ5DgxECeaRhn3gcRfq1vwaDQi35gUgZefScgvHlAH3-dw>
    <xmx:1fVbaOkud-W494iEr4IQbNzS-0V1UR6kFpzlTwD72l58FibULbqwjA>
    <xmx:1fVbaIfrlpViMUitgiaQcdBLUlbSPyCs5WGey28uy--Cqx1Wc9_gkQ>
    <xmx:1fVbaAEk7-1iQdh8M5AduXOQWtrnA8fvSLxi7feyCSux_7AnT6dl2w>
    <xmx:1fVbaEkHyEAST2UpDqUCaXYxRU_PLTw9CQli1EiCgszfK8zQ0Eg4M35R>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 09:12:53 -0400 (EDT)
Date: Wed, 25 Jun 2025 06:12:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: support align and NUMA id in allocations
Message-ID: <aFv11ORZDmM7g6S-@Mac.home>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063026.3379921-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625063026.3379921-1-vitaly.wool@konsulko.se>

On Wed, Jun 25, 2025 at 08:30:26AM +0200, Vitaly Wool wrote:
[...]
> @@ -151,16 +159,11 @@ unsafe fn realloc(
>          layout: Layout,
>          old_layout: Layout,
>          flags: Flags,
> +        nid: Option<i32>,
>      ) -> Result<NonNull<[u8]>, AllocError> {
> -        // TODO: Support alignments larger than PAGE_SIZE.

Thanks a lot for doing this! While you're at it, maybe we can add a few
tests for various alignments of allocation? I'm thinking:

#[repr(align(65536)]
pub struct Test64k {
    a: i32
}

#[kunit_tests(rust_vbox)]
mod tests {
    #[test]
    fn large_allocation() -> Result {
        // Better use `new_uninit()` to avoid allocation on the stack.
        let x = VBox::<Test64k>::new_uninit(...)?;

	assert!(x.as_ptr().addr() & (kernel::sizes::SZ_64K - 1) == 0);
    }
}

Thoughts?

Regards,
Boqun

> -        if layout.align() > bindings::PAGE_SIZE {
> -            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
> -            return Err(AllocError);
> -        }
> -
>          // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
>          // allocated with this `Allocator`.
> -        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
> +        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags, nid) }
>      }
>  }
>  
[...]

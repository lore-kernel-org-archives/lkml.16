Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF481D5160
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219045; cv=none; b=E/xe8LoKJ2WDAt4HIOTC9ewCy1iqqaBI2uLzIYep69xsI7KYol3JAvDvjqDCJ9cA3XS4OHXWIkGHULp7Ygqbdb2VNyOhTpAsFzyW62g0Eg4DyKQDzUiKTaIhdpruw+6ay+TjQJSMU2AT+Ek6AUMaH/qKvo0W4/fNKh5u4A3YLtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219045; c=relaxed/simple;
	bh=pWkUYx8Z7d+7TbYa6z0EEqFa/z5ytSu6rcNh90+Adeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApDALT9TPTmuNCgTuUksczoxPeYe1TKqoobIQ4voAjLlZWOe1zK3zkyJXAKGf3XpUXqTejJePu82BWYF1i1C/C6PqYSHN9izugF5cHB8KMYfK8a+6PzF9yZXlvVKNbz0nDv+GQVnkSWNTJrD+1elzmkAMs0ssrTvRZSKh8Gxtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V8aYPQes; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V8aYPQes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744219042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWkUYx8Z7d+7TbYa6z0EEqFa/z5ytSu6rcNh90+Adeo=;
	b=V8aYPQesjZVroyWbdw6FUR8sQJcgW/XojK5pUS4O9LwXddO5NdcGcdf2RyULs7N74FrFBH
	m2uAuHFVs5fiMCfxs/rg5frLIIFW2Q/mz9bX95OkG3qn3Crg4KhXgh0+3Ad6d8jaN5mFJj
	Bzoh9WV2JHN9y/XZxFgZcVXINcpiivY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-FKTsmKaoP_Ct56V_0gVS8w-1; Wed, 09 Apr 2025 13:17:20 -0400
X-MC-Unique: FKTsmKaoP_Ct56V_0gVS8w-1
X-Mimecast-MFC-AGG-ID: FKTsmKaoP_Ct56V_0gVS8w_1744219039
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5498f71580cso2820167e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744219039; x=1744823839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWkUYx8Z7d+7TbYa6z0EEqFa/z5ytSu6rcNh90+Adeo=;
        b=bK8GjAAlfg+qk0W8NxPd8KWhHTjPD/Rl3kp85FcoVTded0RK51rGZ+noa9qJUtQJ2Q
         UAaSyVP4pfShexX5Hp4aWr7Gr7cLiBt9LrS9bAckOe98FdvdVKjEnVY0IG4fvq7VTZdd
         sqj3oVqdOzJj5YLRYms1eGB00B1tMBPhShY18YZnvmn3lQ+bX4g3yR/cPQIkCT10DD7u
         d/psGWpkSai7I7AaliJ59aS3+29NNy/S7mYPV26g0EDmtCYJH532Z/ptZzPALRgbOtfc
         /gU4DNKRrFamvJ8YewqTXIqfoMg0mo14/XoJWkHP67iXHGGjGYpKB1np97N1D4fKNrfC
         CbHg==
X-Forwarded-Encrypted: i=1; AJvYcCXQGPS3o3SlpnvkY7ujDPB8NiaUx0h+blOHAuhrCLY64weN6KSGi9n2lVC39N/p/EwlmTZtdHoAVnsvcoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVWzgE+rcFMaBjwY3MmbuecIJ5Mv2WfeVVGjsNhkmnQnr/YjKl
	QTuiodDOKC/HJFYW9H5/SGZEdG9YM3Ge96Ncbkm3XpnQys66ZwmAj1BjPObkuaoZvCBAsat//En
	2io2t2RuR4/Phg8J8eK2hR+le2yIAXf/cfkDtS//ql6/wnB0wXLVtvO4ZsnL2nxQOLEEZiCefEl
	vu9CewrH18lu6sVi/4EwTK8vqnwGNSdYdPmsga
X-Gm-Gg: ASbGncvr0hAKKB88WKZ9EdniZyuWiMvTfDpOPYiKc74fE2ZUQIQzrmHqg53pYi+QKrz
	DDch+o3hq8mmiB0t8bqztFLb1C3DgrWvqQXDQgi6m+lU6/MDO81Kuf6UQhKPRkvp/NmSkSQ==
X-Received: by 2002:a05:6512:12c3:b0:549:8fb5:f0ca with SMTP id 2adb3069b0e04-54c43704490mr1164468e87.2.1744219039272;
        Wed, 09 Apr 2025 10:17:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Wo66N3+O53fWWkX9HJh7ijQ9WgsK77lEWNRBj4Og7eVn/S5CEJrJ/K9qYVOyzEZssKlNhqDXx7uyE7nsGWc=
X-Received: by 2002:a05:6512:12c3:b0:549:8fb5:f0ca with SMTP id
 2adb3069b0e04-54c43704490mr1164455e87.2.1744219038953; Wed, 09 Apr 2025
 10:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409165510.23066-1-vdronov@redhat.com> <2172b969-1e0b-4fbb-8242-27518e9f6951@intel.com>
In-Reply-To: <2172b969-1e0b-4fbb-8242-27518e9f6951@intel.com>
From: Vladis Dronov <vdronov@redhat.com>
Date: Wed, 9 Apr 2025 19:17:07 +0200
X-Gm-Features: ATxdqUEvHkwpK_2uGrq1S0cFZrksvMW6yIhqBWZFrI-YD4l1tQoblAZr4YQJGs4
Message-ID: <CAMusb+Q4O4A9Ay7Sdz5LEe0g1fw_w6j2xgC9HOBYhhOk8i0XWQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/sgx: Fix an enclave built with extended instructions
To: Dave Hansen <dave.hansen@intel.com>
Cc: linux-sgx@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 7:07=E2=80=AFPM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> On 4/9/25 09:55, Vladis Dronov wrote:
> ...
> > Fix this by adding "-mno-avx" to ENCL_CFLAGS in Makefile. Add some comm=
ents
> > about this to code locations where enclave's xfrm field is set.
> >
> > Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> > Signed-off-by: Vladis Dronov <vdronov@redhat.com>
>
> First of all, this looks fine to me:
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>
> The code comments are fine. I'm much less picky about selftests.
>
> I'm also open to other solutions here. We could, for instance, set
> xfrm=3D7 to allow AVX2 instructions (which are generated by
> "--with-arch_64=3Dx86-64-v3") or use some compiler flags other than
> "-mno-avx".
>
> But "-mno-avx" does seem good to me.
>

Thank you for the ACK, Dave.

I've tested an enclave with xfrm=3D7 and it errors out at the AVX512
instruction (namely, vmovdqa64) in the same way. So if there is a
compiler built with "--with-arch_64=3Dx86-64-v4" in some future, we
would get into the exact same situation.

So I believe a solution when we disable extended instruction sets
in an enclave as one covering all future cases.


Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A78433D9;
	Mon,  3 Feb 2025 23:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738626330; cv=none; b=dfpryRT9I0PWoMI9NovoSO+c1MNzovdp37FbMZcrNbYwI2mdyIK2V7YwaeVAjxS259Wfkn3ZqrMNzmG1K2OSm+/9ziKkOS+ex2x2hj1Jg5KS1RhJqoInPdj4Bb1Y4eeiSGb7zXpAsj54v6DU5BOGWu89tIuJzLGjE5AlPCrxoBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738626330; c=relaxed/simple;
	bh=3wKrqRvoocBqjwP8WrQ5sMESJ+CSaXEYKVKnpBllifo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXw28xknKrWdu99HViBi8Gww83HfwzveJhPUHoardDmmgXptdxcUZBD7snFuTeUewa9XAxAmNm05teK1PZ/6kn5RTFUp9FW6E/DZ3DK0EWus5xgPIXcs9vtPPDWJBAlR43MaEY88i4hTeYCC1+WEeMhZrYQe4zYlWP/ipxc/nFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBTg+ejq; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBTg+ejq"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7be44a90468so599753985a.3;
        Mon, 03 Feb 2025 15:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738626327; x=1739231127; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9pAAnPDlS62UKmzPQ021WPzDQ16evuT6BnLhtrMFzBk=;
        b=bBTg+ejqpvW8aPjU+q4KtucMqR19m8Jo2neeXMUsUnGf0C0IcxXolnrfkddaYXF94F
         rgR8kT3R7/5Zvms8G2PNRXHX0yAoBwox6hdLKnvuMsHnhGfgcxdqDLcy1sXBRuxC+M5c
         uNJLCcLeVKe5ggc+QtyK/GNvjLEvuWDDbwoc6LpiOccbw/UcT6fA3Y7Ql4DVVagjdhsM
         yY/FrURwXpd8s1d4Tv3vh7fv4aLDNmHfs2ltUjm5EwITUbU+X72zYVp19yWl16VTPTMc
         /fjAT8gPYkdIeRWm44fELmpn+ZbtzIapA6MmxlIsyBl+onJLxRHkY3gg84JLu5ktxLdD
         KTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738626327; x=1739231127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pAAnPDlS62UKmzPQ021WPzDQ16evuT6BnLhtrMFzBk=;
        b=GiYQIB9+trfBypPsNi5CIdNUcpYsIlCcZIa0yLVQuzf7ZvDp609R7VUi/rZaimr+Iz
         KT8l62DLnUbT/DFnjyMEr8bI49OoiZUaXXOJKQC43gGjhlqSwX/Z+aemj6875Ie5f6EL
         xB2ZjF6ffZpxsOq6C5MZ8rnNKabFcTv2RYa1TFE3/15IZpTAkaA8/7wfsy5fcLWFe1Sz
         8TpLFiNYE6ZYkAlZ08Yp65KIB2kwPxCTUtQ5RiPDaZW8As3JsiNfobKSAJchNV4bDzzt
         MayGWXsknWRkcCp8YPlddtERa5czilsB45GV1u2hXuLdDhSAbBzF5v0iCKZ/UG/PakPV
         GIqg==
X-Forwarded-Encrypted: i=1; AJvYcCU84Y1yaE7QvQW4s3wh7819gAIeuL8j8XGLnuXutwKp2W+KhmrzanM6AEG4wGO4EfeamlOC3IZr8WsA7Ks=@vger.kernel.org, AJvYcCWDhXtcUpJDj9nAVg4Jr++gKWTY39uJQJjVjNAOapsfjJxIE31OFZY59CzDIUQpzB6WtOprjVgI+/e4nwRHq98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsCO2Kj3ThLKXPg3F1xJZj92EiwcRZU4k0bfHdmc0BnWWyKyF
	Fo7M0DXiyJgO8FkeUsicPbB6G0aY2RjVfTsrbNqE/JZ4AgnwQcsn
X-Gm-Gg: ASbGncsLZzTWIWX1octv+qhLvdzW4M8h9abyWHZgKtvE+T1b8xT0zApZhEgbr4r+Xvs
	5FY/03331zD7BBCj/8eNgrJt2TJhZqJ5Kzodl36ceLLeMJgB1gFgENYlkcqA92D9Ozbnca55ykw
	KfZBhIhqSMAFCqtHlZiyqO+/xSDIN65ZctXupdKZ4nFecSAL9gkBlAFxmLsF1/OkaIHukjDYkoz
	8A4JNIJ+cF7cdLLAjxWCuu0q/6pppFz2KGaPT8UB6Xk/FHlAuJHclp5p8TciUcAtySqF+eXOgj+
	t1xnV0yCrb/c2tSS4+bvxIwyeOU2cMxFvjBHmr6Tdw6Yr2c3B5FIKgzM2FhA5gyj+0c+jtMzegY
	harcM6Q==
X-Google-Smtp-Source: AGHT+IEhI5jdiUGgFQ8ftpLWBjIUt2c9hPn1+UeZdd0LhFet/EfBYioPIkGij+rG9nrsjWdg6h23bw==
X-Received: by 2002:a05:620a:2889:b0:7b7:106a:19b2 with SMTP id af79cd13be357-7bffcce86d3mr3673963985a.23.1738626327367;
        Mon, 03 Feb 2025 15:45:27 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d14asm579609785a.104.2025.02.03.15.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 15:45:26 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1A8C0120007B;
	Mon,  3 Feb 2025 18:45:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 03 Feb 2025 18:45:26 -0500
X-ME-Sender: <xms:FVWhZ1AVo19qYHnMEXhtS38tEZ_-ST3L3lNbiy1wQ2yxOPwlZnC4qA>
    <xme:FVWhZzgPTItuIZfQe2mM1Im8sXzzUzcI5zRsG10dBpTF89BP1oJ1B-g6jL5CLLiD0
    qNExVUOOGFiYVl2eQ>
X-ME-Received: <xmr:FVWhZwkjDzTG-copDx2fIcc2m0J_WrTr7tMJZO6Y2E2VO_g9CCVI7uIiBfs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeelkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledt
    hffgheegkeekiefgudekhffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehtrghmihhrugesghhmrghilhdrtghomh
    dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnnhgrqdhmrghrih
    grsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprh
    gtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhg
    rgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuoh
    drnhgvth
X-ME-Proxy: <xmx:FlWhZ_xsGyNXVNAz3iW2m10HSonzOwvQeONMhJxcdEWHNmgGDW81aw>
    <xmx:FlWhZ6STK9MLWjUZJkTMaw04NYIh2kBdp2AytmWE3Ui3Eb_lJoxh8Q>
    <xmx:FlWhZybRSeTdfuxcyfz2WoCYzajn1kHLkXLf9QPH8efSMJiyPy5ifw>
    <xmx:FlWhZ7TC-7oWJwdWT19mrZBOnkTdh9Q3P-kTl6plW6pXIEEz6R9odQ>
    <xmx:FlWhZ4BrwGxxiG9zYK0Msnru-JTjfH-uS2zU3fHm-5tSFlyHciuLDliL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Feb 2025 18:45:25 -0500 (EST)
Date: Mon, 3 Feb 2025 15:44:25 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>,
	Dirk Behme <dirk.behme@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/14] rust: sync: add `Arc::as_ptr`
Message-ID: <Z6FU2Tbv1Astxrba@boqun-archlinux>
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
 <20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
 <3zUeHP9VQ7ZaBieXue_fQ_8V8tcTW1nc83OQA7ehwV7itvlpzwF5DHHmyqTU70UzpXhUKWoDtueUb2fsFQdyUA==@protonmail.internalid>
 <CAJ-ks9mygX61B=FOgQegs3uReBHDju2cs6eFRohjNEX_GPwAjQ@mail.gmail.com>
 <8734hid0qh.fsf@kernel.org>
 <CAJ-ks9=gKET-yaTkqta2TfTaxe031yKqnUHNXFjjJH_AYF2oqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9=gKET-yaTkqta2TfTaxe031yKqnUHNXFjjJH_AYF2oqw@mail.gmail.com>

On Mon, Feb 03, 2025 at 05:46:42PM -0500, Tamir Duberstein wrote:
> On Thu, Jan 16, 2025 at 2:23 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> > "Tamir Duberstein" <tamird@gmail.com> writes:
> >
> > > On Fri, Jan 10, 2025 at 3:19 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> > >>
> > >> Add a method to get a pointer to the data contained in an `Arc`.
> > >>
> > >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> > >
> > > Can this mention why it is needed?
> >
> > I can add that after the cut. It is for impleminting `HrTimerPointer`
> > for `Arc`.
> 
> The broader question is: why do we need to implement `/HrTimerPointer
> ` for `Arc`? Even broader is: why do we need to use raw pointers so
> much?

Because to use the C function for hrtimer operation (start, cancel,
etc.), we need to pass a raw pointer of "struct hrtimer", which is
embedded in the object in an `Arc`.

Regards,
Boqun

Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1224F27CB3D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739304; cv=none; b=aPRFAst7IiCDyqW57oeFeMsbBNWKbWU/vNG1sb/U7Xfj8R6cc7EKdWzTqmKG3jOCnTQXHpayT6FFPGEspRffdiwt7g/hRR39eve5hAdZ5WMWw0xoBjyZ5s0N2gESm91WLnZzTnWTQw6+Rd5IwD98o6yc06kJAL4EQUtbB2D5+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739304; c=relaxed/simple;
	bh=y8OsaYSQt0qtOTkomy72QBalnTnPVUp4P7NgjfsfAJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogJDItkK088y6Ap3zRUwFLmzCsI3u1+ixtMHUWv9nMN42O5EeBZw5IyohQpmXyUg3wwrzABmj7rLwa+1RjUlAE+mZaT9D2jGD4WgLsvhOYXxBLdzgl3A0FPFmvFo2cx6ndQe9LvsDPw6+6POx4EAxAZx7wGMq19ybrtZwZ2e6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Gxrp5S13; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dWurUroo; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Gxrp5S13";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dWurUroo"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 249F61380241;
	Tue, 20 May 2025 07:08:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 20 May 2025 07:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747739302; x=
	1747825702; bh=ibje2FDXzQoMEQyqJLykuRup0d2Gh9zRsxvGmanMZvE=; b=G
	xrp5S13k1c25EMSobOeZqUORQ/YID+0aUIdSvG5WLdW99nL1qgV61QvXGbTQzQzr
	5/vKDWh2gJMblRc6iSNRdhMh7TSlT5zhN9LmVVTIz/NwaezSHz6SekrvLsYHqQmQ
	zJf2W0ut4CmxgewMdoksWGM8+ZQcfySCIEhM64RnRaqabuCEQxw4NRzzjHEIkRav
	r6lWTcr7trO95bmutjW6mikhxtXO3XxNNj5teLm4XswP0crdzbJ4YWIWRkF9NQtE
	qiDJlb5WvlADSYeyknPCP9ic4ZIw9lzT5qlfAIKVYmsHGwbX/qGv1M6p7KUIAyOT
	l8UFqYlp0PY8htHbg3LOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747739302; x=1747825702; bh=ibje2FDXzQoMEQyqJLykuRup0d2Gh9zRsxv
	GmanMZvE=; b=dWurUroon8ZS6F+D9F2gfrMGkgvrt8H94aD0pfLUOS6T5nL0UKO
	WmUWKNUYstGsABfEhn3qPimRhicE9dTMrLw2efHbz//DimGnZZge2fW9bcJ1LZfF
	HosaIMaRhLbI0cuT2Xe2SIcpbC6ueA7kFdkqPa/EHLkRoCPPSif/io+sZXdsoxHB
	vGEsg5thKdgO3WYb0+ZnUjVVib8RHmSwmcrT+YWOWbsEjUO9gh2G93j60v/E1Y0j
	fUgyeAkSAqToxBonIVooB6HswhYjqAlcVGsW1HIAzawlWZdzLNNS/77aCRLnOiaI
	qAjkHKpbxfuU0bplacobEHdq1ehG7iEKy3w==
X-ME-Sender: <xms:pWIsaIZXNDRoV6LnEsMzILkVsqH-3CS15NtiukwwFmo6Id4uoqnJoQ>
    <xme:pWIsaDbEaWw8LfY-Id5gj4ZAuYMtUYGhQs0wk_G7lZFaI4e9OeA2FZMIkleh3xVXH
    WGtCHZubWqJvH7wD5U>
X-ME-Received: <xmr:pWIsaC9nedxfd3Ybygu3OROMOMNa5fwTswDjIpP4DXGDPDqq6ZFo0cjC4q3IaHe7Xazonw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecu
    hfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhessh
    hhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepffdvveeuteduhffhffev
    lefhteefveevkeelveejudduvedvuddvleetudevhfeknecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdr
    nhgrmhgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegrrhgusgdoghhithesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlh
    gusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepsghrghgv
    rhhsthesghhmrghilhdrtghomhdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
X-ME-Proxy: <xmx:pWIsaCqVnBgk4z6pfMUpBV6E4fza6e2nvnL7sWyQN-Q_MSzAS1oKSw>
    <xmx:pWIsaDoDq1P4pVXBd4hg2bVgvhDY7fzPN5MeeC578x6-9QqYAdISRw>
    <xmx:pWIsaAQYFQtouZekTOf6N22htjIcD9vypPq99F33qga6XiaW4wVEjQ>
    <xmx:pWIsaDpj3LmXwT4FaIx3r0hrlJxvzAkq7CjqfjYWdRggwvHisL7ptw>
    <xmx:pmIsaKbkD2RIb_jkxZgO5RQVJiTnJ0Lhhgv2a2zmY7xiDrrO1dEY4UL3>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 07:08:18 -0400 (EDT)
Date: Tue, 20 May 2025 14:08:15 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 3/7] x86/mm: Define PTRS_PER_P4D in terms of
 pgdir_shift()
Message-ID: <nlkjrtpuohrsg3u2gqhia7ns7ogrik7ztmks5q5bdhn3y4kfhi@k7yxsyc7j4fe>
References: <20250520104138.2734372-9-ardb+git@google.com>
 <20250520104138.2734372-12-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520104138.2734372-12-ardb+git@google.com>

On Tue, May 20, 2025 at 12:41:42PM +0200, Ard Biesheuvel wrote:
> @@ -61,7 +59,7 @@ extern unsigned int ptrs_per_p4d;
>   */
>  #define P4D_SHIFT		39
>  #define MAX_PTRS_PER_P4D	512
> -#define PTRS_PER_P4D		ptrs_per_p4d
> +#define PTRS_PER_P4D		(pgdir_shift() & 1 ?: MAX_PTRS_PER_P4D)

"& 1" is a hack and at least deserves a comment.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

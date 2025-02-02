Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93619208A9
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738485170; cv=none; b=H4kdJVDB6ip1D8aoZxDGHjkzNZXSaHFjyzsS42F74xOBqrBypHQuTGVn2TZl1s3fVGVFDOrYJbnn2M08K49B6P7sfKw9oOXn1S2Vf4EoBlFw8PboXjqqCnh0khoyfEu6dOUUxSKPMmrjvtLvOr8fpHvvbwdPFMw1gN4iNx34xDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738485170; c=relaxed/simple;
	bh=h5gZJXr1gG8fo7EF0ILDnAS2K7ODCxc8o+NZCCDv9tQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEs11eo65epPoY50BP1yLW5ek3MKCycx8N1g5K7LGS23ppyJyIwSyg0l+yKcCFcf4Xht1dIaNMZeo0F1vcsE3foessjJok6fVZQ0mynnuxf6Fy7ZY0PWuOhMdLkZkVoG5mG8kkokDu0TttIZPWfukTyhZKmZvtGF2LbwyUkE9jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Volj7Dol; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Volj7Dol"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so4420833a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 00:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738485168; x=1739089968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h5gZJXr1gG8fo7EF0ILDnAS2K7ODCxc8o+NZCCDv9tQ=;
        b=Volj7DolC+I+rOHlJ9K0CBigqHjuKnYgYAnvcRIpwOizjMT3AGaXhqeEUzFv1EVqmH
         KKG8TAKCuMDK3QeRlwsPuKtOFTmQl0IgygDpVEfiLHdmLyEbG2MpVhTnlbgwjW1rwTav
         QK8YxHfebKy+5XILMicZbk7DOqzrX9Po7ohZ28Jyme7+TQfjttOJW6Vc3wMIjxXOYdcZ
         HTYJYoTmnUpRrs53CT6JjxCU+QIMvp/kbGDhOVU6c+4gyYs3stVJtsFGy6l8GRnYvMX7
         K15lTZQS+fKkhRGz04glNFOSqLLAw9SDhOD+ebemVC9cU1CoSbA1zqP/WH4tqkrioMle
         2vTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738485168; x=1739089968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5gZJXr1gG8fo7EF0ILDnAS2K7ODCxc8o+NZCCDv9tQ=;
        b=LmWluv38Qdw1OmhKs/uJTXMPy+tXFAd5KOKsktphYY7oboCVsVXnmxoHsPL8B4D5Cs
         l5DUiwUfyU6TY2RZkGbkWSYct3v1nHD9V78E2kyxi1XfMgLViqOhY16u6nMlzZJQQgij
         n1qkirArafe8H0GYYTl91Vh25aA/NSEBNSIgsOGshZ32c4KV9Gmha87GVONI6l9JdABs
         ISv8gE8MtBJyyQM3+TFsdP8U2waaXULo1vG1nHQCLU1nU3mDNNkrBMFipwfIrl6uWBHn
         7A5Xvs9I8QbsATWdrGXnEEiiSJ5BJDqBliv8gJ87HUPgC+V0pHNU0rmisCBTsHv8vh+7
         IbNw==
X-Forwarded-Encrypted: i=1; AJvYcCVNFwsxDbx2SxoYSjWWxkO5NntrYWl/JrEGJM9BaKeJpBZ786fvgTJh6W8WltS0zrh1xoYegLw0juovtug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeSOHOjMe6wamJTh4l4VgrNt1jOi5WSLviKCXWyYRGwJp8urz+
	XUKZzLBmg6I528Lc2hCChQjd1VFeKJ6kkY7c4pDXDxjWbjRTrbaHyMduTy6eKlSJqpcUyy0Ooib
	z/Oxv2QrV2Zta4oF1RZ0xv5xrfTw=
X-Gm-Gg: ASbGncvcQditVkhS+KpnJCDeDtZuD7vOcoro7JmZ7vfXPTHQn3ZFcfEnPpN6jZeNrUd
	mi2O900ypO0OYer7k3kJu/RzyYasc98BcYkY+t+5LuyJIOgrxr0spV1kSH8OlEu0QmrqYzXQJES
	XJ564lMT4VUsw2GQDvk6gAXHhXmpQ=
X-Google-Smtp-Source: AGHT+IF4Xed2UK/m1b70t2nhQ8MCa/ZGxcKczWbWLCesTg1dtRBkKclSXAXCoFAdI2mFiGLkTfshl1Z+s2zbAA4wYng=
X-Received: by 2002:a17:90b:2742:b0:2f2:a796:26b with SMTP id
 98e67ed59e1d1-2f83abb3480mr24835867a91.1.1738485167545; Sun, 02 Feb 2025
 00:32:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109082849.GC20724@lst.de> <210e7b28-de05-44bc-9604-83a79ae131b0@leemhuis.info>
 <726275aa-a3c2-4dbd-9055-a14db93efa29@simg.de> <CAOBLbT8103fAyoFNF8=YcEM1sM6HodcUe=Ee5NsE2hUkfCYv7g@mail.gmail.com>
 <3b693647-5e82-4c39-8017-22cada56eb55@leemhuis.info> <20250117080507.GA25953@lst.de>
 <f81bb87a-c181-4973-be05-f7df84133a46@leemhuis.info> <10e39c88-4667-4c61-b3eb-3dd7ee3074c3@leemhuis.info>
 <20250128074133.GA22435@lst.de> <379bba80-df0f-44c5-a15e-fd4393c52b8f@simg.de>
 <Z5jTKTfKUeLm4uJT@gallifrey> <e01fdde0-4760-487d-af0e-2aecf9d7ade2@simg.de>
In-Reply-To: <e01fdde0-4760-487d-af0e-2aecf9d7ade2@simg.de>
From: Bruno Gravato <bgravato@gmail.com>
Date: Sun, 2 Feb 2025 08:32:31 +0000
X-Gm-Features: AWEUYZkyNSsitq97aeori6flZ7edGQ2TehN5fCXAeaoGoRvqgLYMRyksBa46SfI
Message-ID: <CAOBLbT8V5DkuXzzgp2dPOZkGomqiLa_cdC=e=uWBtcWpP7L=Ww@mail.gmail.com>
Subject: Re: [Bug 219609] File corruptions on SSD in 1st M.2 socket of AsRock
 X600M-STX + Ryzen 8700G
To: Stefan <linux-kernel@simg.de>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Christoph Hellwig <hch@lst.de>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Mario Limonciello <mario.limonciello@amd.com>, 
	Keith Busch <kbusch@kernel.org>, Adrian Huang <ahuang12@lenovo.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, linux-nvme@lists.infradead.org, 
	Jens Axboe <axboe@fb.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I just realized I replied only to the bugzilla list. Sorry about that.

So I'm forwarding my reply to everyone else who was in CC and may not
be getting the bugzilla emails.

> > Is there any characterisation of the corrupted data; last time I
> > looked at the bz there wasn't.
>
> Yes, there is. (And I already reported it at least on the Debian bug
> tracker, see links in the initial message.)
>
> f3 reports overwritten sectors, i.e. it looks like the pseudo-random
> test pattern is written to wrong position. These corruptions occur in
> clusters whose size is an integer multiple of 2^17 bytes in most cases
> (about 80%) and 2^15 in all cases.
>
> The frequency of these corruptions is roughly 1 cluster per 50 GB written.
>
> Can others confirm this or do they observe a different characteristic?

In my tests I was using real data: a backup of my files.

On one such test I copied over 300K files, variables sizes and types
totalling about 60GB. A bit over 20 files got corrupted.
I tried copying the files over the network (ethernet) using rsync/ssh.
I also tried restoring the files using restic (over ssh as well). And
I also tried copying the files locally from a SATA disk. In all cases
I got similar results with some files being corrupted.
The destination nvme disk was using btrfs and running btrfs scrub
after the copy detects quite a few checksum errors.

I analyzed some of those corrupted files and one of them happened to
be a text file (linux kernel source code).
A big portion of the text was replaced with text from another file in
the same directory (being text made it easy to find where it came
from).
So this was a contiguous block of text that was overwritten with a
contiguous block of text from another file.
If I remember correctly the other file was not corrupted (so the
blocks weren't swapped). It looked like a certain block of text was
written twice: on the correct file and on another file in the same
directory.

I also got some jpeg images corrupted. I was able to open and view
(partially) those images and it looked like a portion of the image was
repeated in a different part of it), so blocks of the same file were
probably duplicated and overwritten within itself.

The blocks being overwritten seemed to be different sizes on different files.

Bruno

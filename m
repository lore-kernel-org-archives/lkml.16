Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDDB20371A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660393; cv=none; b=i1qdspowFKeE4jL0uKaZmcsIRGXzzSuSGAQbxVHBdPKONN+UcqnkWqpUYLiJOxyPNWdAbGrxggs7MoAe2/Wfq3qNFStl/6nbsQe9NghCExVCu0n89qVpt4bLEce/6h2ALXvVe2lLBCL0HKb3w7BeAQz+udtLKa9PPa1/+c2cq7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660393; c=relaxed/simple;
	bh=Zj7E2MeqphGb/FoGa7alLHmNq9sT8LOGDhFNQC0kVjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAUVVmJjrNRvm0aBwlLJqfWOLMDY4zDYGNV/IB7F54tlBSUF+MfjRwQH9kabMDvprY4dFf3QuTc4lrdM3991qJh8dWheI8EJkfACGuZLEhytOvNSPwL8B70NJR6w0H1XDb5XkY2cXHeZ7sTQQ57YO52VUJ9qpkIRO9hSuvzeB90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9r9Sj+y; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9r9Sj+y"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9cd9601b8so221452a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 01:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738660391; x=1739265191; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+AHMI1n0um1Uc2f0ky1zL1PO/sMw1al2b0gfWEzKF20=;
        b=W9r9Sj+yyBsqYDBXCX1i/6uXJbY0vLZRtlN11E+7Xt9gUGz8DKpbQhY+d63mUp+joh
         xF/pYY0tJsSSzjZg2eQNcx20vnhX7BxYS1a4Wk8PDmxwtE/9RUqnTQSAyK64pmmXOJgo
         5qIOOWvVEPtJcbzl1ZcZ5JEaRyswwX4FeL4lasGyokUEWfSoFnlZsT9TT/fSODs9+PQp
         X7g3volBzpnKPPksOFcDo6aWGtuKiXvmYuCBqNAsYbpNZg+/YQkC0t79Uu29Le8cnFhW
         BFA7kkjY7V/Ux/KJJ1KcJ/pwqOSOsvp2RmJ0BsE7dxDBE560LuHWpGADg2HWjkUU/2SN
         xdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660391; x=1739265191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AHMI1n0um1Uc2f0ky1zL1PO/sMw1al2b0gfWEzKF20=;
        b=qDaVhx5xdbFQ9snUkFTBLNdM/+7jJLXNtVy5lSqejpJk2AMwK1iU2krwCIhkZDkZPp
         0a4kXKGCnmEkoPre0CZ8HxmK/Xj7Xc61I1YCBqIWg8U6IeRdbFJLI5Hi0HWXREVh5V7N
         2BGeXmw1KtPF7/b1tX0OuLtnCYR3xcPxAL0oI37O+E2AmQzey79VjnSdF20tsPdRQJ7H
         n8y/uMUlqPZUYcphgqQrerHTTSwCFPcjIpBzP7I3ipXbD4JTeAr2Fr7gWyfV3QcwzQoy
         d0ePO2Xnf2hS4gWWhUGebgh2Z0/W4A1agSceBq1BE2QkR2bMmNhDgD68zekjwdHHZZ+R
         qXAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkbIdyA2Br5EjY2MnJpeN1YcBLYwdUsk4Ngl91wPur9eaqckQM5iqjCmUvlEerfJRyFP7zqSbP3KzQYiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsl29gtAvdZ+GFJ2nYUxu+031E9US+8yX/MTfK7PI1ysuX4Qx+
	RQ+DU6kSjaR1Ujlcm4/FO7c75ataa+yhmSO4liVd2b8JgitKE3QOvlMvjnBkcCzDM7vu57wEagj
	sQOGWVqDWRBtCo0uWFz/TIoB4X+0=
X-Gm-Gg: ASbGncsQxg3YH2FJRpdM2BNB6h1JZySgbeMlYLyFJ5svafPH8jg18f/DevbjFiGCbr0
	Cog5JCpkFckqM7hLAXMGKt9JZ6UGoFuamGVDbuLViMGVZ+AE+sJy/YuBLFo5Z1G/OmRk3Pvycsy
	efZRcCtRE5DWzvpiuRC3snCz1Moqo=
X-Google-Smtp-Source: AGHT+IEjr+5p9ULMzoc/xpn7zcsHmFh9pQft0Sd8GQkkXIpsHHX4xJoLdzK+6o4pH/qlQ/u3VVH/AFYlbacH5FUEJZE=
X-Received: by 2002:a17:90b:51cc:b0:2ea:498d:809f with SMTP id
 98e67ed59e1d1-2f83ac5e467mr32092446a91.26.1738660391086; Tue, 04 Feb 2025
 01:13:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOBLbT8103fAyoFNF8=YcEM1sM6HodcUe=Ee5NsE2hUkfCYv7g@mail.gmail.com>
 <3b693647-5e82-4c39-8017-22cada56eb55@leemhuis.info> <20250117080507.GA25953@lst.de>
 <f81bb87a-c181-4973-be05-f7df84133a46@leemhuis.info> <10e39c88-4667-4c61-b3eb-3dd7ee3074c3@leemhuis.info>
 <20250128074133.GA22435@lst.de> <379bba80-df0f-44c5-a15e-fd4393c52b8f@simg.de>
 <Z5jTKTfKUeLm4uJT@gallifrey> <e01fdde0-4760-487d-af0e-2aecf9d7ade2@simg.de>
 <CAOBLbT8V5DkuXzzgp2dPOZkGomqiLa_cdC=e=uWBtcWpP7L=Ww@mail.gmail.com> <20250204061208.GA29300@lst.de>
In-Reply-To: <20250204061208.GA29300@lst.de>
From: Bruno Gravato <bgravato@gmail.com>
Date: Tue, 4 Feb 2025 09:12:54 +0000
X-Gm-Features: AWEUYZklsTO1DdX17XI0s3UrJDzPBR2NguTIOGWaQniEHqaiG2AWZWpwapwJWK0
Message-ID: <CAOBLbT_kn+5H-+RYM1UOAkxhfJnpqKMNv9_d_Ys9CgY_=TcdsA@mail.gmail.com>
Subject: Re: [Bug 219609] File corruptions on SSD in 1st M.2 socket of AsRock
 X600M-STX + Ryzen 8700G
To: Christoph Hellwig <hch@lst.de>
Cc: Stefan <linux-kernel@simg.de>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Mario Limonciello <mario.limonciello@amd.com>, 
	Keith Busch <kbusch@kernel.org>, Adrian Huang <ahuang12@lenovo.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, linux-nvme@lists.infradead.org, 
	Jens Axboe <axboe@fb.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2025 at 06:12, Christoph Hellwig wrote:
>
> On Sun, Feb 02, 2025 at 08:32:31AM +0000, Bruno Gravato wrote:
> > In my tests I was using real data: a backup of my files.
> >
> > On one such test I copied over 300K files, variables sizes and types
> > totalling about 60GB. A bit over 20 files got corrupted.
> > I tried copying the files over the network (ethernet) using rsync/ssh.
> > I also tried restoring the files using restic (over ssh as well). And
> > I also tried copying the files locally from a SATA disk. In all cases
> > I got similar results with some files being corrupted.
> > The destination nvme disk was using btrfs and running btrfs scrub
> > after the copy detects quite a few checksum errors.
>
> So you used various different data sources, and the desintation was
> always the nvme device in the suspect slot.
>

Yes, regardless of the data source, the destination was always a
single nvme disk on the main M.2 nvme slot, with the secondary M.2
nvme slot empty.
I tried 3 different disks (WD, Crucial and Solidigm) with similar results.
If I put any of those disks on the secondary M.2 slot (with the main
slot empty) the problem doesn't occur.
The one that intrigues me most is if I put 2 nvme disks in, occupying
both M.2 slots, the problem doesn't occur either.
The secondary slot must be empty for the issue to happen.

I didn't try using the main M.2 slot as source instead of target, to
see if the problem also occurs on reading as well.
I could try that if you think it's worth testing.


> > I analyzed some of those corrupted files and one of them happened to
> > be a text file (linux kernel source code).
> > A big portion of the text was replaced with text from another file in
> > the same directory (being text made it easy to find where it came
> > from).
> > So this was a contiguous block of text that was overwritten with a
> > contiguous block of text from another file.
> > If I remember correctly the other file was not corrupted (so the
> > blocks weren't swapped). It looked like a certain block of text was
> > written twice: on the correct file and on another file in the same
> > directory.
>
> That's a very interesting pattern.
>
> > I also got some jpeg images corrupted. I was able to open and view
> > (partially) those images and it looked like a portion of the image was
> > repeated in a different part of it), so blocks of the same file were
> > probably duplicated and overwritten within itself.
> >
> > The blocks being overwritten seemed to be different sizes on different files.
>
> This does sound like a fairly common pattern due to SSD FTL issues,
> but I still don't want to rule out swiotlb, which due to the bucketing
> could maybe also lead to these, but I can't really see how.  But the
> fact that the affected systems seem to be using swiotlb despite no
> good reason for them to do so still leaves me puzzled.
>

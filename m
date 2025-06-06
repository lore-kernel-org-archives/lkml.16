Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB625C6EA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 06:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191796; cv=none; b=cX4wMNsnoqaCqz0ObS1S+rtF/Yia/dsCYTUrZu/ow7bWDYxuZMBtkC0vA+JHSZBgbvkjmzyWuAW6Kb88cWeSlSg3pL1K1IJI+986pFJ8lwe7wM1gWZNk4+Jk/8LoaqPJZ6tEDA81v6zWfeNIfNt1ICe+e/PaWsVvs6l8hLZCBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191796; c=relaxed/simple;
	bh=toV9IQaPqvqASnNJNFj5X1N4rgKmvC/sEVmE6pwDqZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bP+b1DLpPY0V8yOMnxu+MnLEydJBjUboL88LXQv2viIiRD9DTNz3DXSJlxOIXZ37YG/rexufr+W+T1ZZnx0CC457LZfVzrfqrj60ee3WELkO9BOL8x6U/kuQfpig3g0KP4C165x+C364YL4NKzgBxY0fPBYHIigClmPbiVlkzno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=HxxmBM/D; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="HxxmBM/D"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f8b2682d61so31198776d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 23:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749191792; x=1749796592; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=toV9IQaPqvqASnNJNFj5X1N4rgKmvC/sEVmE6pwDqZM=;
        b=HxxmBM/DYAvkfcu4YMYJf+w0AwjNo61jmhlvS2U5ubD4Y2Ig9nOgO7lMekrQlg1s1f
         WC1UVF/ybFltqlN2JMwuTax7ls4uK/T2roi8/FaxZrjPAyeHyRhTCrGuu/zmSL8LNZbM
         8WF+2Vj1I/0elDU9enM40y/3DtwQn1KcuIp2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191792; x=1749796592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toV9IQaPqvqASnNJNFj5X1N4rgKmvC/sEVmE6pwDqZM=;
        b=eSLE/IB7JD0jSKN/poOgntcde+BO/sDj5vByrSEZc8KDzUVyNqwms4+EoDj9nXbDxL
         Eshce6Ep3Zsqca6jI99Og+12JfN7OEu/zxRtV2bwZYxhpNMZ/SzuUuWTh8EFSbVS4QHI
         ve6bTJDYJNl18q9rRXd0IV8yb8pmIl2bJj55pZvHS/8QtphPrS5Std2YoHHvr871G1yV
         qYS1tEVDrOzVN+iIQGPguw9qPfmbwb4AvqYfyFrDpLJ2OLNUrQUVjKWReL3tAwwYlHfZ
         32oh4LSF3jwSEMZ/b/GUQgWrdt8NE1rornMQmKA1xuDqOxfmZRB7YMwSSoWYGxneYHoU
         pwZA==
X-Forwarded-Encrypted: i=1; AJvYcCURJQU0hDiLGVasRMnrolMVJjQruawME/rYr/tFqP4XoV/SsZQvBjIucR0X3U/XID9ezIVBedFInOBvm/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WdrziudpAXYlRdwUMRGS0bWDhTsbt3wQdI7kxxs0QGljpDVO
	vCX30KQbypvvN5/3kVXwN1vhLwxtJPxYro5VESf3zOjm9aHS1fNP5jzWYOcPEaJBiLKT/4QbC2Y
	h+nmjFICK2WEvA5pYWLG9hn8sEzL7OF3HH0wUCKI3cmtaRZtGaQ87
X-Gm-Gg: ASbGncs1dlQ6rFx6kacI5/DfNcEPY92BAZk5CmK31CAA1DuvetprK8H1DeVNu6nkDdO
	aVHaEIEs9u7cY+0KUCaOXQd8wX3d5nqon2CJWoNInKmoF/+bw0Mu21cjdl1K7UPsGs7xvdlhccp
	ifjaRSgUmO4fggesy52YeGwtqnUgMf64mlIGk+26jofw==
X-Google-Smtp-Source: AGHT+IHZrb8oAUUqWQq5BNm3Ul6xtj6V0TOzDYLhpLP/ffaA9kQ6VFwAI96cX+m2oJJdGnfs/tFQhr6ii63ncKo6CfE=
X-Received: by 2002:a05:622a:5148:b0:4a4:2d6d:80a0 with SMTP id
 d75a77b69052e-4a64b6511admr22914341cf.10.1749191780124; Thu, 05 Jun 2025
 23:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJfpegvB3At5Mm54eDuNVspuNtkhoJwPH+HcOCWm7j-CSQ1jbw@mail.gmail.com>
 <CAHk-=wgH174aR4HnpmV7yVYVjS7VmSRC31md5di7_Cr_v0Afqg@mail.gmail.com> <CAOQ4uxjXvcj8Vf3y81KJCbn6W5CSm9fFofV8P5ihtcZ=zYSREA@mail.gmail.com>
In-Reply-To: <CAOQ4uxjXvcj8Vf3y81KJCbn6W5CSm9fFofV8P5ihtcZ=zYSREA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 6 Jun 2025 08:36:09 +0200
X-Gm-Features: AX0GCFs7rakD2EWiToYlZOoJVn9Hy1NZM9uDDVwqBk67n4xvc5_i2D2NHsaiR_k
Message-ID: <CAJfpegutprdJ8LPsKGG-yNi9neC65Phhf67nLuL+5a4xGhpkZA@mail.gmail.com>
Subject: Re: [GIT PULL] overlayfs update for 6.16
To: Amir Goldstein <amir73il@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	overlayfs <linux-unionfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 08:17, Amir Goldstein <amir73il@gmail.com> wrote:

> IMO, it would be nicer to use backing_file_set_user_path()
> (patch attached).

Looks nice, thanks.

> Would you consider pulling ovl-update-6.16^
> and applying the attached patch [*]?
>
> Thanks,
> Amir.
>
> [*] I did not include the removal of non-const casting to keep this
> patch independent of the ovl PR.
> Feel free to add it to my patch or I can send the patch post merge
> or cleanup of casting post merge.

I'll redo the PR with your patch.

Thanks,
Miklos

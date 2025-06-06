Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8992191F7E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202436; cv=none; b=B1NJ5RDUK/FR8MWfXkZUINuVC9bUjxK/c3YC4iwkpBWzubr7NTDz6x6OIQBzrCpMrzHBQUiCV+XX3fWNLoibWnsNh/8fijUJhzVsGiDTqD8zCDVBZkpo5ShDzAT+iFWO6vhgqy0HCQlNaDlVGvwyZ9GiAsoL9MZ9f3uk3wmsDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202436; c=relaxed/simple;
	bh=NCD3FsHqX/tDsdqDrxlXUdzTVx+2sqRGtUtrxLK6jAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTp85mLTHkqC6B/JtzMvMtiZZIpDqHE6qgeZNRCimS3nLfVFQ74IKIsR/jRRdsp86h5/J8nQ3c7eHqB3Oqab27wQrpbEFXr0wwf3+OPuhWcFvGxYFMwjbbQ/dKTFLsZFz+kl6gRdQT874iq9M6we3zAQ3lsFxcaoJUD/wL9X5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=lvAG+tHk; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="lvAG+tHk"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a44b3526e6so23027611cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749202433; x=1749807233; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kjjJoIKAqPL4Fi3nMaT3Fad+/StO4aRC+TRTWdCbeTc=;
        b=lvAG+tHkEIFwrw/yQXFUo0RH+vfERl2p/X23Pzswzv4TaPWDxbepHDZIr3RmqV7aCq
         eaYotMiBY26iIMwt2AJx45me/PQfzUI+tHBfPK4n3fEhAmGz0+VHSoA3l8qW+pik3ND1
         xvYFl1SOljGyKrq/Hwp/2q+u8k3l9uDXzQvJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202433; x=1749807233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjjJoIKAqPL4Fi3nMaT3Fad+/StO4aRC+TRTWdCbeTc=;
        b=f7iz6cquuscrFtn1bdNvqWpb3JYAgRNPPr3sGNrjtUCpmcJwXHwn9fyqXay2tIqjKC
         qOYxVMa5RA9YbJY4l1ixUg+82HlurVh8WmGHlJ5V03dRG5bSHa1JHH48li3MJZ7IJpFB
         7nhFe7mlpixnCHhGNctel40e6yAboLFDTe6YZtDGhGKBfCnJa2Dz1Pa/jAMJGOa+SUTm
         SH9Pt0vUYcjvHUISMVoJUOURd5/BTZHCXjulc3U25DjuGH7i9WLqxf/NPcMBqrUytl2x
         8vw+pnffy1gY1/KSPbV9PNjpOr2jbL1u3tlJMPO1TW1gAAKyjw9orWBsrlumqc1I71un
         a3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC2LCKAxecIWK3N7Wi2A5gEW5VISi19PEM5wStd3dHI1F1udE3CC7LWqXrDDw1hnezUoOGszZ8hl3SEzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHUkFEWqHM0LbIHa3oTf1zABGZ03kCaWwsvIqv1MU4e7wMNNX
	V+kOzvG052iL6t+vNJLyPnte4NuuwRbh9Rn4tpiuWItLG8b77NdH5LAD1xxLUQl+b+ehRFCVJ7Q
	xL8ACrcIpTtLrCDhg5NjKIbw86pDW0JjmyJ58QWRHjA==
X-Gm-Gg: ASbGnctFOLjHf1ohEcv8B3r4dLmq9amoc0zZdFKlo7lt/vnvlmwT7flgR+XOfseBUz6
	smYmlUISA8Bj1K5fuPVMkY2Z/AVQtFCxk/5/MQgs+2BWRhW8+3N9uL2JTJmyHjKydSv8WUZDLHz
	HvDxxDS9ROU3lptoRKElUFe/KUGYTP6gM=
X-Google-Smtp-Source: AGHT+IEpD8A+u93yY7dMI4QI7COmSAbaXPHLO6KjHqBSEgUYxk/Jw0ZYl1TrJ9sLHanEFIt9Z9r1xEAOroted7uPQME=
X-Received: by 2002:a05:622a:428c:b0:48e:1f6c:227b with SMTP id
 d75a77b69052e-4a5b9a47e1amr44216851cf.26.1749202433527; Fri, 06 Jun 2025
 02:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJfpegvB3At5Mm54eDuNVspuNtkhoJwPH+HcOCWm7j-CSQ1jbw@mail.gmail.com>
 <CAHk-=wgH174aR4HnpmV7yVYVjS7VmSRC31md5di7_Cr_v0Afqg@mail.gmail.com>
 <CAOQ4uxjXvcj8Vf3y81KJCbn6W5CSm9fFofV8P5ihtcZ=zYSREA@mail.gmail.com> <CAJfpegutprdJ8LPsKGG-yNi9neC65Phhf67nLuL+5a4xGhpkZA@mail.gmail.com>
In-Reply-To: <CAJfpegutprdJ8LPsKGG-yNi9neC65Phhf67nLuL+5a4xGhpkZA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 6 Jun 2025 11:33:42 +0200
X-Gm-Features: AX0GCFvFo8VWZRAyQvoO_OwOv8y44RwyQfaZo7GsgVMP1nOljN6vif8ZNW5sSOg
Message-ID: <CAJfpegu1BAVsW5duT-HoMGiSXNvj2VsLNfTuzvF1-RLyVLDdTA@mail.gmail.com>
Subject: Re: [GIT PULL] overlayfs update for 6.16
To: Amir Goldstein <amir73il@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	overlayfs <linux-unionfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 08:36, Miklos Szeredi <miklos@szeredi.hu> wrote:

> I'll redo the PR with your patch.

Pushed to #overlayfs-next.

I'll drop this from the PR, since it's just a cleanup.  It still won't
break anything (and that's what I meant by "trivial"), but it can wait
a cycle or at least a few rc's.

Thanks,
Miklos

Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDE93D6F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747044392; cv=none; b=pgWibD9HVa/Wuzq55SRJIALhw22c52ksmF63+apglWzcjzxtZ1Gep9FF9KmfREvhIiQ6rVAZA1AuozdFm5r8UKVXUTrAV1YNqAEiaicjXANkaG+JYDlDR0UxHBzGXg4ekO5suBKg7AXniJXm0abdkqXCpFakP2EjtU2RJaETAVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747044392; c=relaxed/simple;
	bh=jXo2APXH+xZdQQ1LPdxw6AqlF+M7NqB6TWjVGZL1Pwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7DALRnFRAXUd/4t5z1gX4EXLHO0rozi/KG5ljfl6sAv5H04van+XNTZu8ExFp4XnQ66PrWMrUBwg7/tD68UBpa5zvRPm1VdSdR7YLtUTPQAdBqcTSHZy6TkR8+W7eh7XFc+O0xeZ+mUm+rWgOiKbN4c/oubibCY4uWtRSjLPTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=aeUuY6JI; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="aeUuY6JI"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4768f90bf36so46207811cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747044390; x=1747649190; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ao78gq3UEXd8+O1os8ysUZZc/hcTKpCJXFEJKk5K5HY=;
        b=aeUuY6JIupNfBF+0zRN/r6ngAws7GZusdCsZvYozypCq5WBMl/WgVuhCjIQkA4vqqS
         WxGB0ViNLMaGIdOktggHJ8P8H4Am8gNnvBq4OZ+VLg1TRT34pdfkVRDjFAOH1IQPVJ1F
         in8dnmmbHxdmj/XEqQzpaehluL4lHC8ajmX7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747044390; x=1747649190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ao78gq3UEXd8+O1os8ysUZZc/hcTKpCJXFEJKk5K5HY=;
        b=cGwQdya5XM31PDDKfPmVyaSJ8nNbu1bDITDC6RqVHGeSP5wJnLaqSSZ9hrrlXPPlKY
         dtMIOM6ypuGSVFL5bUEMV2o/rGtniooCGI/pCrSpQQmcHzjpccEFOtzN3PW+y6G57+g/
         48YLl/4DqwpEttlkXiVPF9hP9a5MiRVxreyOJbZ6KhZX0OITbTV6eX4+RjHJPEV9WbMp
         3xNV//jVMM+tmF0mf528Zaoh9yYeqszydussMaHWSrb/RCCtxweHAWWZ4b+9E1ga7NIB
         dF9yzoCeV4Mco+SXjLL11uBNqMMQeHhL5bu9GPaCu/BjZS6VgxrfszP04qjNurQmEuuO
         778g==
X-Forwarded-Encrypted: i=1; AJvYcCUsX21NDxi2tSXxP44HiaZxTWKcOw8mqHwS20NCGXC2E/63m32QaMmWSFfqyfByxhX9jRwQbDWvaXF1kV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3rj6dLXMGNhfli5H24DkYAXkiKt8EQEvr9eyzE0pFXNLZH4EE
	SkmNysFw/IGdZLe4v4nqU0ePmZDT+2ET+p2tq+Te2C2mfdXXQmalcEu7EP3bf7HkyMEVBi3HbpS
	LcMl5ZSL2wEJ65YXyoiUAUdcKDrmrAVcFsiJFmw==
X-Gm-Gg: ASbGncu+buir8BZsOjxqHt6dbVLjq95NJOM5Aes4nWmqqym/jLY2H9CsEZEDzMooGn5
	Kp79oHgqRzIuzhF5MHSFEuLkQ/822TrRvtHR9dC3OqDtFRSRv9x1m/2+6Xqezbe2iirirnEzBsw
	sD8rynToiiHPsi6hCPwkIW5XCgEe+GLIwFvzk=
X-Google-Smtp-Source: AGHT+IEL+WJpAtsUDvmDFSJLle5njdmLjkHtqOT7RZHsP38BRVAq3aJtECH83tD3wgaufsVEQl9+03hZAMPCwLXkm0s=
X-Received: by 2002:ac8:5e07:0:b0:476:8eb5:1669 with SMTP id
 d75a77b69052e-494527d49bfmr199930401cf.32.1747044389876; Mon, 12 May 2025
 03:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
 <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com>
 <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com>
 <CAJfpegsTfUQ53hmnm7192-4ywLmXDLLwjV01tjCK7PVEqtE=yw@mail.gmail.com>
 <CAC1kPDPWag5oaZH62YbF8c=g7dK2_AbFfYMK7EzgcegDHL829Q@mail.gmail.com>
 <CAJfpegu59imrvXSbkPYOSkn0k_FrE6nAK1JYWO2Gg==Ozk9KSg@mail.gmail.com> <CAOQ4uxgM+oJxp0Od=i=Twj9EN2v2+rFByEKabZybic=6gA0QgA@mail.gmail.com>
In-Reply-To: <CAOQ4uxgM+oJxp0Od=i=Twj9EN2v2+rFByEKabZybic=6gA0QgA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 12 May 2025 12:06:19 +0200
X-Gm-Features: AX0GCFvJ3rdELA9Zd75iROohvom6E7GFIBvRnwkO--uzCE2DW0agj0_PJPIYQow
Message-ID: <CAJfpegs-SbCUA-nGnnoHr=UUwzzNKuZ9fOB86+jgxM6RH4twAA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: Amir Goldstein <amir73il@gmail.com>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 11:23, Amir Goldstein <amir73il@gmail.com> wrote:

> The way I see it is, generic vs. specialized have pros and cons
> There is no clear winner.
> Therefore, investing time on the getxattr() direction without consensus
> with vfs maintainer is not wise IMO.

AFAIU Christian is hung up about getting a properly sized buffer for the result.

But if the data is inherently variable sized, adding specialized
interface is not going to magically solve that.

Instead we can concentrate on solving the buffer sizing problem
generally, so that all may benefit.

> The problem I see with this scheme is that it is not generic enough.
> If lsof is to support displaying fuse backing files, then it needs to
> know specifically about those magic xattrs.

Yeah, I didn't think that through.  Need some *standard* names.

> Because lsof only displays information about open files, I think
> it would be better to come up with a standard tag in fdinfo for lsof
> to recognize, for example:
>
> hidden_file: /path/to/hidden/file
> hidden_files_list: /path/to/connections/N/backing_files

Ugh.

> Making an interface more hierarchic than hidden_files_list:
> is useless because lsof traverses all fds anyway to filter by
> name pattern and I am very sceptical of anyone trying to
> push for an API get_open_fds_by_name_pattern()...

The problem is that hidden files are hidden, lsof can't traverse them
normally.  It would be good to unhide them in some ways, and for me
that would at least mean that you can

 1) query the path (proc/PID/fd/N link)
 2) query fdinfo
 3) query hidden files

And by recursivity I mean that third point.

Thanks,
Miklos

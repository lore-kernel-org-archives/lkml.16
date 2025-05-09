Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F37230D14
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802789; cv=none; b=YuGOC89kYiohrDma5IKV9AfPmoz2lAyMHrIYAQ5sTMOT11xhrAikdc40AJXYGKPbAyM+ZaVN7ROLvV/CSts5E42++T3V4y5A2+rINiaQe761cGregNSjVtIqgkaMMUYfgoN6z0Sxrgdau3uTJoY62+gj3PxEMu4eTIEwfdEx78Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802789; c=relaxed/simple;
	bh=OvMYc1/NUx+TgNc2MMSVWxhyIqAkyH8S2lTspemIULg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+0g2n3CHUcbRlWO3Tp0/1sxWknidfluTsfF54b7Z8eYeASyqhTtiZ8dNzZH8WjUlzdej3/raxPEWv5F7HB63R6culvdV/jDW3ovbM7NWy6qZzimdc1wKuXdq3nnsHwWu2mkxVoPFTc71OLRzTtf/buChf98qlETmpLjBj9SUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Ezl4Qw9J; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Ezl4Qw9J"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476a720e806so21240081cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746802786; x=1747407586; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MNXRVZ0d/TjYbo6sUWZT1QLfUnTslA1zk9rlwUpo1tw=;
        b=Ezl4Qw9JDyf9TCS/xQkNcL6GUAoaAPjZGQx8bp0e0LqITQK5hY84mEMofy1A+lRelG
         W9EDyRJNcVysyC4Fb821TTgNVBPtPQ1PTD126FvPZCBnyOOZDpiuhiC08+9K8FRDNvtc
         JbxFMqzKThidN0ptbISq3Yq+Vls3nrawxX7pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802786; x=1747407586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNXRVZ0d/TjYbo6sUWZT1QLfUnTslA1zk9rlwUpo1tw=;
        b=WoQnQaTEw8oXGsfNAvEuFXBCMcJVbAevAcKxL6sdWS/8qZt+jN4vU1IP2z0C4c3uYR
         ipJ/u1QtMP1zcWZ+rkOruJ05nSj113e4ho0jQRedFYWaG643ZUM6xmOUvH6e3ij/9pPl
         Clk2uoUyA5QEXgLeGnEZBATfvehvOWbFzVU98JllwLqXmFs4UupIivcdb30L3PrHR3LP
         ZydlYBfzHzTGooux5pjEQ/UjwbHoAveJ3QgvrlVUyOmhvrUVY4TluK/K2UZ9nXju7C19
         7Z/hFwPdYNEk7cHqxvUrjIul0lanxILLjN/9m5Y6hE6qp2NAqKImvSqbOWyBeNv6dEJf
         qYeg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/2gyd7BbNzpmH6MrITmx1tKDOl7jQKaypXi7jOg+OyLczIguRnVijWG/BjdgI2KyBnNClGdDxPpAgFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDn6PlAlSInnEBwshxJpJ35K47jNbc5CA3Jw3S7b3d+9L55BCL
	aFB+eKFDcslb1VqFyxggksN8F3bOlDTlEY5/+FwKSsvDSktvw3kxR6uz8ulzwat7O4BDlgBGA4H
	ZI8rflqH2gMhV1ZI5h4hHOrxYdiVlDh81Gegx9w==
X-Gm-Gg: ASbGnctFN4wZTNcQD1KM0Ojs0jmLgjSmUxmeoesOajhpN8xLI1YNi6xcir3FSEIAGCd
	GKMtsQ70ACyZSjHrHX95lsMI9aNdmmo+mzlTfM/QEPi63A3N5N/RJH4X++aq4fBHLBqeEi2lxRH
	4bg3qA0jbQ2I0nj58wr/ZwSgybbXnlYFrEUUM=
X-Google-Smtp-Source: AGHT+IEGg5EPbwceICKwU9GYa8CHn/MC2J5tKBbA2YoAU+VowXJmNgUja1eah9jrraoBnCvYPjDb6UQWdVrv+wNUAJk=
X-Received: by 2002:ac8:598b:0:b0:48e:2503:9966 with SMTP id
 d75a77b69052e-494527efdd3mr43429321cf.51.1746802786021; Fri, 09 May 2025
 07:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
 <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com> <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com>
In-Reply-To: <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 9 May 2025 16:59:34 +0200
X-Gm-Features: ATxdqUHzlndRCdmL06YZ6rW7gSuswirUqpTeDMbgj-3obx94kuYTadQnEG_x9Fo
Message-ID: <CAJfpegsTfUQ53hmnm7192-4ywLmXDLLwjV01tjCK7PVEqtE=yw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 16:43, Chen Linxuan <chenlinxuan@uniontech.com> wrote:

> Note that io_uring has already exposed information about fixed files
> in its fdinfo.

And that has limitations, since fdinfo lacks a hierarchy.  E.g.
recursively retrieving "hidden files" info is impractical.

> For io_uring, the path could be the corresponding /proc/PID/fd/* of io_uring.
> For FUSE, the path could be /sys/fs/fuse/connections/*.

Since lsof is ultimately interested in the mapping between open files
and processes, I think using  /proc/PID/fd/* for fuse is also useful.

> But for SCM_RIGHTS, what would the corresponding path be? Could it be
> the fd under procfs of unix domain socket?

Right.  But I'm not asking you to implement this, just thinking about
an interface that is generic enough to cover past and possible future
cases.

> I am also uncertain whether there might be similar situations in the future.
> Would we really be able to find a suitable path for all of them?

Open file descriptors are generic enough to represent most kernel
objects that need to be represented in userspace, so I think this is
not a worry.

Thanks,
Miklos

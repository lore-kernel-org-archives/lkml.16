Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110CC29994A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529893; cv=none; b=N90JJRwI8Rp+GsgfRrndoYdvRYH92q8KsDXus5CjXEj6gHyzMMY6sfMt2BpCvBghHdgHw0so4zzo5Zr6UYzhHVnZiMFaoPr7RBdvrRRwDpUHf4udo9Q9etUl0UUPbzxVHXig+c5AknYN1E/MXepbdaPkdtBoh46VRxZWCxEpKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529893; c=relaxed/simple;
	bh=KvalDRh4CpUY6NV2UFbapd9yWhjn1u9jISdDY4zirCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLkepjEFLDMF2GFAByf9WjphrUF9SsNeFd8oKkhEI/6oHrP0MZHKDQZJ9H8vY87KvRilIZIs0crE/VQi3of7VlufewYXDynco60ISTFbhdQ/FyVI2IzYFHc4CoV/bP4kboE6Voj32BjmESDtrZ9o4hwgM1Hn7DuXN+P8qhD4tiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLVrNxTb; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLVrNxTb"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-886c8de5d90so435533241.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751529891; x=1752134691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATJPy1abN1qWwrpTRG1mDV5ZFGwPco0oE16lntKl3nI=;
        b=FLVrNxTbkcQTHo5k3STYAJFXFwMRxuNiIHBvQS+7OPhO05og5RrT2pG51u5F+8NmBQ
         B8Uc77V6WcPHSFpX9xAfTdgFX3BnQf+3kMODmmgZ7LzMtyDntLs/uAwygihqTf7zE+s2
         Xz2WqSoLq4FwmEjDIkRiaPOgkUxhv0viknStIgzPjpw10ccRVGJJXevojOvE8abBW3nj
         rnQunhigcVV/vaVuvt+04M5drhCe8uUK1iq20oMo7eXXmVGNPqu7qQu7RYuGOG8USORu
         51vtiL9sXNOFPmmX0W6/r08DbDoIiQrTErVw46FbyMuTyDJeXRs5QW221cMh7lp1hU7l
         OD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751529891; x=1752134691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATJPy1abN1qWwrpTRG1mDV5ZFGwPco0oE16lntKl3nI=;
        b=hTwOiHNk0HKYPkUmc41PIQZXfPtU8w/v4X8BTMyU743p3xG3Otn0WgmGF9EljB5q0w
         y6B/6BIx4Q7jlJdd2kgRtDP5eEHk7GIcc88jAzuRzIsiKk2+9WgKv15LWJ7/eivSfhty
         G/0P3iMuWXdV3MSXnSlN9lm+S12YTTkrS1e5jouMhaawe6kind/1jl41jpv2iJP2zQRV
         B8ScerVnFVvmATLxtJxSFTtqZkgbTbCPvTuWfQXMzyYJ14ly+re1kiIYolR5+0kLv20b
         M5yGkxD23kg//VfPH0rbT2T6IUaAF5Svhuek21pHVdz0nc092MWzjFbTBLsVFxiZu+z4
         t6Ng==
X-Gm-Message-State: AOJu0YzeAAXgbBNcoQ6fQHJzNMOx/6zjV2AORvEcmO5+XiYSzgkgbJP5
	mixtn7LauMADXcKueoTrSYej1Bs3QxIvlnquLJPfbP3T9FeBRlyV9feKViQlh8oXa4W72N4F7VX
	nFhZijDVRLR0wSOpiHXxqfTs2jXuh3K0=
X-Gm-Gg: ASbGncta7ua5T8GABiJvZir5aAeTYJVs6mi9BsYcYvTQa2jzjr8YokhGB1aGdRxlnxw
	VJTEXaocTjWuetz9KHylj1CYXsQuFdCdsptvsGu2Vq1taJHKemdDQeC56zY4SqU/om76cO61C1/
	uXn57zTtdmKrlE5pyxDLuNYQISaJDA7/PPtHWaruuL1w/zQO7fDBPZ0+5fF/+vJjbZvpGf+h7eo
	uab
X-Google-Smtp-Source: AGHT+IFDiZKME+AH6/+5hPItSNUU3kYyO7wvK5G3HkzJqYsfDTeUapTb/huy4F2x70UjOaM/kaPkIVgeRnqN+vjJExg=
X-Received: by 2002:a67:e7ca:0:b0:4e5:aa74:ac0 with SMTP id
 ada2fe7eead31-4f1747d9466mr1941183137.8.1751529890864; Thu, 03 Jul 2025
 01:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEy91+YpzU5tKEfsjt1_Hh0fsiCfVVK099EztXOPFGHFYyA1KQ@mail.gmail.com>
 <20250627163758.GV1880847@ZenIV>
In-Reply-To: <20250627163758.GV1880847@ZenIV>
From: ritu pal <ritupal888@gmail.com>
Date: Thu, 3 Jul 2025 13:34:39 +0530
X-Gm-Features: Ac12FXxc7NPGYEQ2BDfbdzSrwgPFbqhGBZ-H5n6o8mSHdhvDjppw7Ce4m-d1jM4
Message-ID: <CAEy91+Z=8+MsK10uiMiAf0k-EWSd3-o33yfckc3tsEz7pvmjVA@mail.gmail.com>
Subject: Re: ipc/mqueue: release spinlock before freeing node_cache in mqueue_evict_inode()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	NeilBrown <neil@brown.name>, Chen Ni <nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> That spinlock is inside the inode in question; what exactly is going to b=
e
> on the other side of contention?  Note that none of the file methods
> are going to run concurrent with that...

Another thread that's waiting to acquire the spinlock to process the
next item in the mqueue.
This change reduces the hold time of "info->lock", since the kfree()
of the node_cache does not require a spinlock to be held.

On Fri, Jun 27, 2025 at 10:08=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
>
> On Fri, Jun 27, 2025 at 06:11:14PM +0530, ritu pal wrote:
> > Hi,
> >
> > Currently, mqueue_evict_inode() holds info->lock while freeing
> > info->node_cache
> > with kfree(). Although kfree() does not sleep, it may take a non-trivia=
l
> > amount
> > of time, increasing the duration the spinlock is held and potentially
> > impacting
> > concurrency.
>
> That spinlock is inside the inode in question; what exactly is going to b=
e
> on the other side of contention?  Note that none of the file methods
> are going to run concurrent with that...

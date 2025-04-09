Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277DE210F53
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744238954; cv=none; b=dgSg/cUUKLsIISO4yc4d9KtSqEVds/30hb0z1PYUFkRwiT4+qnd/qoRrMhgbyv8pbV0Brj3OAMwbQ/kVPAEutcLWCFxLiVtiuCFVOcAWqFdHmye/OixjWSD6CLLcu/t4AqvqFQR8LOTg4HmjX8cXjWVUTPo9rEtyy2OqveKwP6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744238954; c=relaxed/simple;
	bh=ra3g0WSTHGlONWh4dVaSP8Ga7ymiMHvVu5Uub8yg9PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdVmMa/BtR+Wap9gYEpIClMC7tVOnQrKIDjHnV3ZPDu39L8eo5cdtmZHa+DGn/tPupbS5ov2gNmMhCAMiu63sbjeVIs2wiK2TaFD0m9Up1klFVtDtm4kYXEjfDYiU/UGSbN6hbPJ/Nt+HYUO2pGXnQ55sJDkbKwSRh4JW0VdV7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=TB0GYylp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="TB0GYylp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22438c356c8so1792065ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1744238952; x=1744843752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZvDkyQnbebY09h0oUEJJQU6pkyHBZyFHnTgbadKnrA=;
        b=TB0GYylpD61oQAjoYujCTPG0AekLJaOji4HDSxlkoe5py0JcjebZuMjSr0BuBYE55C
         8cMQUApFTM49Z1kVJLXWMP6mOBqfU7noKGCvPO/ALVFDbVy6VDf0W7Y53gQ2cl7Vemap
         5CxLEA3OK/E9LvwQfdiLukXirqRmgBJW1bauVrVmhIrmNZtQBktTczNj/FHAkS3b2JlT
         rc/U9FNyWK5/pEJhXhqnnGpsamf/mgQ3UeruJV5bPDiTancYsXWMlJfhMV21pCCQ4iX4
         I+AtDQpG8P+QAcica3H9BYVWNJJ5Lt8hmUEXvKgBcNuc+YLs1j6G5nCRtPl/zZt2Iq/I
         tvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744238952; x=1744843752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZvDkyQnbebY09h0oUEJJQU6pkyHBZyFHnTgbadKnrA=;
        b=iXFRMkxnw9hqDD6QtkbnLN+kzWUY3lzu82dXwubDvDrngkMo5veflVbDMKTsn+i8Hc
         2wHHRdSbkr8nKknuWE8UPspXqpPvMsXXiGmeTmBkRN/juLW3JfcIOg5XNT0lXXcZxAan
         mvLsVV0towR4apsCVp0gRntlF3Cx+knQbklItmJvSAYJgffuNTI2LMZBpjLai39zK3hx
         N97aFkOkgF164v2JtHea/U9FS2Nmyk3g+r+ZJSEEy9ayf/BfFe5xc64qoOPI4l+4W0jr
         x5qSymRYv1DBb1GBU1Q9VnbFcgHqap039ihyqog07p0foQrAaC/M8A/wneFicbU4qu8J
         BQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUe6iVoMiRx5j3RFoNuEK1/5gKIjxtJzIPJJCm7yAmikC2oJMHrzMAM2Sn5h91MPyHS+bndMQPaqhCm7E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN2h5F3cp21p77G8qnBR9EM9EWbGn16btUOTkBg5RkXZB7pw+J
	MvjmXwhy6AAQ+y7qfH56p48qNT8+u2uautqQ9BwVaP/RctaFxJs3Kv0Ec69in6c=
X-Gm-Gg: ASbGncswqmI7WfO2KwOxZxu+8TMtpTXssWILp7zwmFfKMywK33yI58Y6cpPnuiCckcD
	kpfUoxb3NUsvP0LkxrTXdH9kOwI+O5zzCzF/oHM10Um0rtWOv1TwCIpVGs76USAfQjTUaUUAVR5
	mv5bj+D1ZhBHulWahRMQESj0/qQ8K1WtQjJAvleCcgmrr+dWq0JLyX5aEq0qxY/g2gJ3K89FjBz
	BrC6YhFVq3nuoLgZzrMjPLrjuH2BcGWodhSzjmIN+D8LCE700bgpMz0PoWgRNPbApkqNB9NVGrM
	Li/NZqmqRl0MQsxh4gXwThaAblZTUeQeBWnBJ5QQd7zwLU6norqKi42twS2K8yYUjRy5lbHjhSj
	098cDA0bmrSYJz7NTKIvLEOPp
X-Google-Smtp-Source: AGHT+IGjJAjcitAQAv4Chk4T0tkE8kfKdHQ/aWkSJyTOTVip/fuhtkcZ66iizlmv+Slne03pX68yaw==
X-Received: by 2002:a17:903:440d:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22be0388787mr34105ad.40.1744238952293;
        Wed, 09 Apr 2025 15:49:12 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5463sm17613765ad.195.2025.04.09.15.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 15:49:11 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1u2eEG-00000006eLH-2B66;
	Thu, 10 Apr 2025 08:49:08 +1000
Date: Thu, 10 Apr 2025 08:49:08 +1000
From: Dave Chinner <david@fromorbit.com>
To: John Garry <john.g.garry@oracle.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>, brauner@kernel.org, hch@lst.de,
	viro@zeniv.linux.org.uk, jack@suse.cz, cem@kernel.org,
	linux-fsdevel@vger.kernel.org, dchinner@redhat.com,
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	ojaswin@linux.ibm.com, ritesh.list@gmail.com,
	martin.petersen@oracle.com, linux-ext4@vger.kernel.org,
	linux-block@vger.kernel.org, catherine.hoang@oracle.com
Subject: Re: [PATCH v6 11/12] xfs: add xfs_compute_atomic_write_unit_max()
Message-ID: <Z_b5ZK8H0pK0Saga@dread.disaster.area>
References: <20250408104209.1852036-1-john.g.garry@oracle.com>
 <20250408104209.1852036-12-john.g.garry@oracle.com>
 <Z_WnbfRhKR6RQsSA@dread.disaster.area>
 <20250409004156.GL6307@frogsfrogsfrogs>
 <Z_YF9HpdbkJDLeuR@dread.disaster.area>
 <ed53dc33-c811-4c20-8713-8d2d32cb81d7@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed53dc33-c811-4c20-8713-8d2d32cb81d7@oracle.com>

On Wed, Apr 09, 2025 at 09:15:23AM +0100, John Garry wrote:
> On 09/04/2025 06:30, Dave Chinner wrote:
> > > This is why I don't agree with adding a static 16MB limit -- we clearly
> > > don't need it to emulate current hardware, which can commit up to 64k
> > > atomically.  Future hardware can increase that by 64x and we'll still be
> > > ok with using the existing tr_write transaction type.
> > > 
> > > By contrast, adding a 16MB limit would result in a much larger minimum
> > > log size.  If we add that to struct xfs_trans_resv for all filesystems
> > > then we run the risk of some ancient filesystem with a 12M log failing
> > > suddenly failing to mount on a new kernel.
> > > 
> > > I don't see the point.
> > You've got stuck on ithe example size of 16MB I gave, not
> > the actual reason I gave that example.
> 
> You did provide a relatively large value in 16MB. When I say relative, I
> mean relative to what can be achieved with HW offload today.
> 
> The target user we see for this feature is DBs, and they want to do writes
> in the 16/32/64KB size range. Indeed, these are the sort of sizes we see
> supported in terms of disk atomic write support today.

The target user I see for RWF_ATOMIC write is applications
overwriting files safely (e.g. config files, documents, etc).

This requires an atomic write operation that is large enough to
overwrite the file entirely in one go.

i.e. we need to think about how RWF_ATOMIC is applicable to the
entire userspace ecosystem, not just a narrow database specific
niche. Databases really want atomic writes to avoid the need for
WAL, whereas application developers that keep asking us for safe
file overwrite without fsync() for arbitrary sized files and IO.

> Furthermore, they (DBs) want fast and predictable performance which HW
> offload provides. They do not want to use a slow software-based solution.
> Such a software-based solution will always be slower, as we need to deal
> with block alloc/de-alloc and extent remapping for every write.

"slow" is relative to the use case for atomic writes.

> So are there people who really want very large atomic write support and will
> tolerate slow performance, i.e. slower than what can be achieved with
> double-write buffer or some other application logging?

Large atomic write support solves the O_PONIES problem, which is
fundamentally a performance problem w.r.t. ensuring data integrity.
I'll quote myself when you asked this exact same question back about
4 months ago:

| "At this point we actually provide app developers with what they've
| been repeatedly asking kernel filesystem engineers to provide them
| for the past 20 years: a way of overwriting arbitrary file data
| safely without needing an expensive fdatasync operation on every
| file that gets modified.
| 
| Put simply: atomic writes have a huge potential to fundamentally
| change the way applications interact with Linux filesystems and to
| make it *much* simpler for applications to safely overwrite user
| data.  Hence there is an imperitive here to make the foundational
| support for this technology solid and robust because atomic writes
| are going to be with us for the next few decades..."

https://lwn.net/Articles/1001770/

-Dave.
-- 
Dave Chinner
david@fromorbit.com

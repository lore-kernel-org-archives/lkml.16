Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7A679D2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254815; cv=none; b=MWhfxm5ZPzaSOgZytOI5smwNlz8F2mUN4GlbECFtcRIAMflh2p0SONhd0SxJRE5WxFVGiIL9+FndeQkbcaBLeTOX91msDeRTq+ZAEE8ZFPAXIA/cek58gORhu7qEFhkai7N4+Rc2n2JjpAwBPp+JKCWFSX/kHKDDqnkcfR1oGS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254815; c=relaxed/simple;
	bh=bfMbO6WK0BKl25ma0GekGjztEJi/z8mdR9cHRYTUpwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUhY3UtvDdCkMZKbUXvZxyYoHL0+m7Ee39ImpvvnRed30Of2FF5ZfY/DXzjO699kYVeIqrO1MC4S+nLKE3hOmefiM0qk6DibuOqu1p0BrvMdgjo6Y4L9/Eog68T4SZ/4CnK7dQaxmkC/kaBY5P8TqnVAmuqdOKp59kQ2tJSR7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOkG0z4R; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOkG0z4R"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23636167b30so11988265ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751254813; x=1751859613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pzmu1K4JJ3zo16PjdIAB9kkwSrXC2wV9EcR27ZBj8/4=;
        b=mOkG0z4RAmWSyUM7gr01Sz0CG3xbvfFNH4CWlbG0WkqslPhKf6qz+zWg02T2dnS/Tc
         yvnPTq+sL6V8mJUuMWRLFuRmpQHOy/iC/EzdbphUoUBQ/pm1v5qIj1/th2q5aPjYbCR3
         7TECSx6HQsHE6lVR5vDlyUGt1HDTvl3LyCSepYbsq0zLG9vE0+6pG3+QzfjEO8NXwui5
         Erx/iBjsDGpm+ly1dQQgk1H14ir1+EkewlYE5f4qsZbMKyfD9ORsN0kGUjCpUC68nuf1
         5qAjAnh+5VwPIbhbctLh5kse3Up9TLwqsVHJ55MBJP8dG4sSzrJfkLpeAnqPH+5+OZA2
         IuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751254813; x=1751859613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzmu1K4JJ3zo16PjdIAB9kkwSrXC2wV9EcR27ZBj8/4=;
        b=j8cObmy3OFKHaaOQrRYuRm7t4FVMGo1feRse07tlDgpQSe7tc44C5dqMXkp6A5wSdu
         5rU0i5cXzGxMlaCOZhaRtPewtlnaLlVsg/O4Kpy3D9kfTfPwwNXGJuyoB7cPQKUAh5Vb
         GP8Qj0J+XR46xA6Ba8mPaaGFIQmYgcMo9C4gut+0GKydF3eUsojEdvw2824s3d2mEoy2
         QVK24SxekDLaJ9H6CdqIOlmrc5a08sMkjTDPKTxao/EZpwiMyzSXi/zPXbuyjIeqeyw/
         LhiR0kUR90yYiiZ257aQas2m6Xknhxslg5EpGDkiGR4fulSCs+BwJC0TkIAQsS5fKqyk
         3iEg==
X-Forwarded-Encrypted: i=1; AJvYcCWBB1WIQytVJ43+VM+A5tnFJ6weSURP/HQs4bR6XlQSY8L0QnjcTB2YvoYO3Vkowm4fsRUaom0VOZF0ces=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59A1N9Vwm3clphm+YYP5CmdTkKK0yRm0IaQw9ga1rZcRL6y4j
	6ykkGOrhSsJNXZabgNDqrD4aJex6nJFY0HZtM66FuZGO9dlyetVSvOJw
X-Gm-Gg: ASbGncuRna3DfVr9QMMAVP7S3ujt84G6iAyFXFmK2APZznWdMwJl1xYo3yLCQqlcmj7
	/fxJAH+oYMu7nZ7oVzzr48zBVHHSKarcVPESnRBxSAKR29zQJxmlPhByFFmCnv6yNcrs+n364s2
	2DzNVIdc9dxCGOsruI920H45aMWwTPa9oimE39PqrInH8sfeSH2VegSWFuP6tRUpntzIc/jsBOm
	nqmeECcLQXcw++RndZiLGH8S+PoSUqLR0QctjjKJiCfGbXWjYh657yrhVou6/I1ukT6H9HX87Qv
	8CaO9L8MtX8NJtUFPm6PhTuBYfN+RaX6uYpF9BEYVJDnBhDyL6nTkfqxXFIlO9JVzKdyis5n57c
	gLBek/8kGcTAD
X-Google-Smtp-Source: AGHT+IGAi/A0RnJBXP04znAaf7ISR2PfyJDSIKfFd2Uks5eUzzXBq32IWYpqP9TUY6Y9G8nXAGH8aA==
X-Received: by 2002:a17:902:f545:b0:235:ed02:288b with SMTP id d9443c01a7336-23ac460523bmr157603105ad.30.1751254813096;
        Sun, 29 Jun 2025 20:40:13 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55 ([2601:646:a000:5fc0:84f2:7459:db60:b146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c13a270csm7778173a91.16.2025.06.29.20.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:40:12 -0700 (PDT)
Date: Sun, 29 Jun 2025 23:40:10 -0400
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: Heming Zhao <heming.zhao@suse.com>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: syzbot+20282c1b2184a857ac4c@syzkaller.appspotmail.com
Subject: Re: [PATCH] ocfs2: Avoid NULL pointer dereference in
 dx_dir_lookup_rec()
Message-ID: <ckqrcag2cnsrwjccxyzd76vne7epsei7swjulpkfkzwjalk2lj@5iweq3oucsab>
References: <20250627023830.150291-1-ipravdin.official@gmail.com>
 <d6c72ab8-d600-4cc2-9609-8b749b61703d@linux.alibaba.com>
 <d6a11613-9763-4d9a-b4ad-5f451f770b70@suse.com>
 <f5qcns4xuba3r52cmqoiwdfveyv3xez7zhohq64ktcswjw2otk@qoqlu7ui5yp4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5qcns4xuba3r52cmqoiwdfveyv3xez7zhohq64ktcswjw2otk@qoqlu7ui5yp4>

On Sun, Jun 29, 2025 at 10:45:15PM GMT, Ivan Pravdin wrote:
> On Mon, Jun 30, 2025 at 10:32:35AM GMT, Heming Zhao wrote:
> > On 6/30/25 09:26, Joseph Qi wrote:
> > > Hi,
> > > 
> > > 
> > > On 2025/6/27 10:38, Ivan Pravdin wrote:
> > > > When a directory entry is not found, ocfs2_dx_dir_lookup_rec() prints an
> > > > error message that unconditionally dereferences the 'rec' pointer.
> > > > However, if 'rec' is NULL, this leads to a NULL pointer dereference and
> > > > a kernel panic.
> > > > 
> > > 
> > > This looks possible, but syzbot reports slab-out-of-bounds Read in
> > > ocfs2_dx_dir_lookup_rec(), not NULL pointer dereference.
> > > 
> > > So I think it is because it construct a malicious image and set a wrong
> > > l_recs, then access this damaged l_recs.
> > > 
> > > Thanks,
> > > Joseph
> > 
> > I think this proposed fix (at least the fix method) is acceptable.
> > the crash occurs at ocfs2_error(), where the pointer 'rec' must be incorrect.
> > look back at the previous code lines:
> >         for (i = le16_to_cpu(el->l_next_free_rec) - 1; i >= 0; i--) {
> >                 rec = &el->l_recs[i];
> > 
> >                 if (le32_to_cpu(rec->e_cpos) <= major_hash) {
> >                         found = 1;
> >                         break;
> >                 }
> >         }
> > 
> > either 'el->l_next_free_rec' or 'el->l_recs[i]' has an incorrect value.
> > we can do nothing about this kind of error, simply returning errno to caller is sufficient.
> > 
> > btw, ocfs2-tools has a similar function "static errcode_t ocfs2_dx_dir_lookup_rec()"@libocfs2/dir_indexed.c, which sets ret with OCFS2_ET_CORRUPT_EXTENT_BLOCK and return.
> 
> Thanks, I will include it in v2.

I have realized that ret is already set to EROFS that acts as a general
FS errno. Unless there are any other objectives this is the latest
version.

	Ivan Pravdin

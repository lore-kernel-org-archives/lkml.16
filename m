Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1562750E4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698514; cv=none; b=WT6NgluHoku58713xZUDuF/OyqfUbgd303fNmq0uLTVQtDDv4CntCzrQvWfi2w3DaB7p8+vMfPbhqa4oZ9ssigxmc+rcRvirawMCt1MAHbSWePEXLNVVGMUBWRnnzx5kJADx7s+em7/+/pXATu93EGAhxYpX2vhS8l2GVjPCCi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698514; c=relaxed/simple;
	bh=X39eHBhdFBSiCEm2m+e26AcgXtmlEFecV6SteKWwAjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAWkAxCiUxfwoteP0V/q0kTc0VV36KIvN13X7VHfenVTgXTnXG6UdzP1p24PXzBr0XIbdxsbj842i1WOHP9/vL22XVGqM/wosMYD151C7thxFZlJR6dS1V+SkJUOSsBaLIN320Zkyu+NlyzmE8cPyLphtsZSjuGwc5pAHqsWUFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiBCfdd2; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiBCfdd2"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736c277331eso5638450b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744698512; x=1745303312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i1eMj/yq/QS4xuzZBmesii5aSUb7a28QU4slGXIDLs=;
        b=IiBCfdd2gs+/6uy+fPvwhV8C2CUmC5eJUtfgrSBQyx+GhSMgUcUh1SjyKWlTlwYWLK
         b37jU+wWveK6uLY0+FdUdzaVThN1HNAs0A8CcXdV0hQ5eQrDm1N3ZyLK3/pCjl9Q4cGe
         v7qBD2ccVgbxDeOeLry8X8tT3s/YpNzAWjTrCQfrfx30bM9pL/mE3vCVtHn/mW4HnOs+
         EuLeAOWz2XU5A2dLVtFyVlh8DPuPT0a0yfPMhuiJ8ITupkXS19YtmuLX+ANgHtJgmGCz
         ii3RdseJVTJlkr3c3N8R7tGGy3aAuKMzh7FvyJec3eoTMev4HtQmgSAOdRM79ASoudJb
         86Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698512; x=1745303312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3i1eMj/yq/QS4xuzZBmesii5aSUb7a28QU4slGXIDLs=;
        b=bt8luRp+Cj7AujWIsrCo6Jy/vPh02NDaGaQ9GlP+VFNdklMg7oyJ5QMuDXwGFejlrg
         apXPUQP1bc+jbaY9Cq8cWPuwmnFbfDy8WF8dZmjWNj9uT1FpiLkDEEFe8RBz1E51davk
         Qqs8MEpHrWz1zEsxN95IPThjg8e9S+XHh+z8afknvyFBunV1UTDMEPo21oExxLXLzH1f
         gtNuId8xkh3Ie2hJL/ZKCzigOIjVCqz+luuvsxObqlmkxWSvfK4aZzqGUmqfcKJ9fG5B
         ZIa87W9i6UsPfs2oQArwUupnKgmUfoQstrQJd/FWdhS26HrmbrrqOOAqopXBHqr1Uzmj
         k17Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdAsy3qYDhRDTRAvEEXf8fdI7FBOT3ZRjgrKQK0NcXX/iVhUbjX+WNVJzS1VzRYcRTyKpxbYw1R+3v47k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9byUo60qaKFwWKrJMFx/S2H5RDitUehs3cJaaoz20rIoBP41e
	rD/+1MUNmylc/lZkB7rijOtRQQduphAkPL7MGICjfmgfPs9aOg9tkqiIuA==
X-Gm-Gg: ASbGnctP5nsDMYSXiNiFlw2ZMFS/qIzI+Tx2hx24Pu2o8xVYJjQW3jYf4597HpGWFIq
	5/pBnDmCx9YrAWHfzx4kAJFZfOf32oVm3bEuQRbtdaBB2K8S94o2X6yhPedssRnXDwgNqzCDtwG
	8KBtY5DkHAYruWaDn4oR4DHEfnZRrUdaVMR211p0+usr/OURsQdMH8MHnd6sUX+jzta4si2iRe1
	CJG6RJQG2RS6ABNXiRJ/KgiBkU8VsZdiIkXzppUWqEFuTFGwYJqhC3XQo+NCdXD7Hysscpk1g39
	iwxgIhjjE3oXY8pmbEBA649uz3cNqvMswA+rXwSoOk+82suwrKk=
X-Google-Smtp-Source: AGHT+IEvPpB9wf0yUyCk36RQlZkFUClAMF0m5aKE2V4LpxDt0C18vi2fJdNIS56vZxjlio4V0iIF2Q==
X-Received: by 2002:a05:6a00:3a15:b0:736:b400:b58f with SMTP id d2e1a72fcca58-73c0c746908mr3670081b3a.0.1744698511937;
        Mon, 14 Apr 2025 23:28:31 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f12dbsm7976414b3a.102.2025.04.14.23.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:28:31 -0700 (PDT)
From: Jinliang Zheng <alexjlzheng@gmail.com>
X-Google-Original-From: Jinliang Zheng <alexjlzheng@tencent.com>
To: tj@kernel.org
Cc: alexjlzheng@gmail.com,
	alexjlzheng@tencent.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to per-fs lock
Date: Tue, 15 Apr 2025 14:28:30 +0800
Message-ID: <20250415062830.306165-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <Z_1BSLbvq4zCYEu-@slm.duckdns.org>
References: <Z_1BSLbvq4zCYEu-@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Apr 2025 07:09:28 -1000, tj@kernel.org wrote:
> On Sat, Apr 12, 2025 at 02:31:07AM +0800, alexjlzheng@gmail.com wrote:
> > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > 
> > The kernfs implementation has big lock granularity(kernfs_idr_lock) so
> > every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> > 
> > This patch switches the global kernfs_idr_lock to per-fs lock, which
> > put the spinlock into kernfs_root.
> > 
> > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> 
> Given that it doesn't really make things any more complicated, I think this
> makes more sense than the existing code even without any direct evidence
> that this improves performance.

I agree.

thanks,
Jinliang Zheng :)

> 
> Acked-by: Tejun Heo <tj@kernel.org>
> 
> Thanks.
> 
> -- 
> tejun

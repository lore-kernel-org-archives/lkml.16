Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DACA243364
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635979; cv=none; b=inf5yIDfIa/NcVmRc54I9i70HlSZDUGMQbGDn2QWGJhLHdz4VhMMv1fYE2JkOyOXxKukIsSOjSN5UyTiSK4Ea0WqA7l9TUUAfo2P7/jKRRWh9PX4pdhn9SRIgCs3Y78IZKrzzKp9IHOylHLwlBMjxJ1GO+4u/cmObfRPyxKtH7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635979; c=relaxed/simple;
	bh=3/0YNkCjboebYy7FYvRPStFV/R6BxhWufBSPZl9LRoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nlx7SlxgUoi98qEp1rV/JYhbckU5cwHYz58tJa6XG/5+Z6wPGF9oCkD8nj+YgJBQVBjzpJFKqLQhxXYPz4ZWS9XnylGEH1UtV+Fm0t2vxXY5IMvYaba9ZHlliO3NK+JsbgMNckjM6EgV8orI0LFqEgtKnxT5vF45RB5sOmrsv2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6WppDsA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6WppDsA"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73712952e1cso3720648b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 23:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747635976; x=1748240776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWxiWWoevLtui+2Q816C18FoVZShKeU4+z72oyVMeAE=;
        b=c6WppDsAXquKWFTla61+sWuDwBa6QhZJ71AfVaWNbC1pLR/jxtlrY/L8+lALevn9KX
         9wyyL3wpql1S3n1PWvSBtMgUC8i1dR0I3m7RwkZl4h5KE/ShMN/tU3a+E4WK6AohjuDD
         0K5Tmj9IqUVIrNXNsiv5870HZj5w9F3Bbt4JZH+BuRKQT5hoB6G9VAQDBgw7y9/TcHFW
         vLzKl9SNbxo8HNa5xUF8QecWhzxEChq4uPQVRwDZ8dAP4N/kR1Taxp58wwdd1Y84VQ/u
         Vujhvb3ViodniNa4KYkSTSROQCdfaCEXgNQlBK1O2Dc/8Oio3Z2WNaXwT6PJZV38b5aG
         oKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747635976; x=1748240776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWxiWWoevLtui+2Q816C18FoVZShKeU4+z72oyVMeAE=;
        b=nVqqlAIvmvX62WvkdztuLnOukubDFFWFvnneldkAuwx4y89BZ2mSdjnK4oGb6ayXqs
         rlYIwl/hXHJ1QAMiXXA23HA72y4buoUG3KVlhnyv4WWnIy5pHvOFNx3r709KvUvgsCWj
         cFF4ixV514caWh7ON8RB4nfAmsudfOQIQHtqB0v5gtjGeIMCP9TNHr0HIhuFfB8XUHhg
         ehcNtq2w/pqiKyLNu0RUvdaMZtEvVVdNjPSN8hDbrXaOUWYLCL0wl/oxK9tzzO3J23Ok
         YmMfwI5nSHsyGAD9YOf2y+Aoy53MNZzc+eqIL0a7Y8nKE12RtSKsaaqYr8vHDy8Re05D
         7Kwg==
X-Forwarded-Encrypted: i=1; AJvYcCUIfarJBfrl9NGZZ3B1Ju0BEopNDaTCOqVDF7KxJFPRrCnaW2+oiODpd9zk5pbKqjrbcDqjFjlrf1ytDxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2UihJUXu1f5tZSQ0xr//2sODIg1rAJe7kzJJEQhrwb+kT9hvE
	1TdWSRXK0hI7dcPMfm4T2OhnwUbzghJYIGgoyPVE6h6UNPO/QYZ8vgLl
X-Gm-Gg: ASbGnctu549CypQ0wtknN/qnCuyEgGigh9DZQKHJCHXm7q6dpO0i2X1uSLPtxFmjb/o
	GMbHHj3lCMY3NklD/qt4Npio26BI+OhJc8eoc1v9ll3LexYw2POCetKisjifPRYdrMhU5gAmDmT
	zeZVEH8qYf4EbcM5ulmvP+XxmKFjjwpjOudTkEgQsNlsEVAerhtvc16YuRtQv/xU6A98Qw1XRKk
	0bqqZ/uNuVN1HRdL5KTWYcn/gK9PyA3GpFfgzDSxiftCZnZBlKcVwh7prXFUl42jX+CCdtidtWk
	+wHF0LLP6Ub/mUIYpMK3VnYks3H3RmjkmCYf7YekXZkjwtaq2mxCUljEprHnmI8FtdZQ1Q==
X-Google-Smtp-Source: AGHT+IGmkOUH6qpMHvgR5iUTW6clZrFuf6mfg/hIbJxOzrjlpLKw3fd9givoUpchP3/XsUsjRRQWjQ==
X-Received: by 2002:a05:6a21:9208:b0:1f5:839e:ece8 with SMTP id adf61e73a8af0-2170cafa2demr17995676637.2.1747635976266;
        Sun, 18 May 2025 23:26:16 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.138.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a2550sm5460847b3a.167.2025.05.18.23.26.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 May 2025 23:26:15 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: ryncsn@gmail.com
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	chrisl@kernel.org,
	david@redhat.com,
	hannes@cmpxchg.org,
	hughd@google.com,
	kaleshsingh@google.com,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nphamcs@gmail.com,
	ryan.roberts@arm.com,
	shikemeng@huaweicloud.com,
	tim.c.chen@linux.intel.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	yosryahmed@google.com
Subject: Re: [PATCH 06/28] mm, swap: rearrange swap cluster definition and helpers
Date: Mon, 19 May 2025 18:26:05 +1200
Message-Id: <20250519062605.2357-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250514201729.48420-7-ryncsn@gmail.com>
References: <20250514201729.48420-7-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> From: Kairui Song <kasong@tencent.com>

> @@ -889,10 +849,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
>  		/* Serialize HDD SWAP allocation for each device. */
>  		spin_lock(&si->global_cluster_lock);
>  		offset = si->global_cluster->next[order];
> -		if (offset == SWAP_ENTRY_INVALID)
> -			goto new_cluster;

We are implicitly dropping this. Does it mean the current code is wrong?
Do we need some clarification about this?

>  
> -		ci = lock_cluster(si, offset);
> +		ci = swap_lock_cluster(si, offset);
>  		/* Cluster could have been used by another order */
>  		if (cluster_is_usable(ci, order)) {
>  			if (cluster_is_empty(ci))

Thanks
Barry

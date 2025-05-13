Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53A32BE7B8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158298; cv=none; b=PnHzr/y/quIHtHwaY67kIYu/ka9U2sKwuWCbrzRCh+3xlFyi9V0qUaXr7neu+ACPjDMuF0nIm1bs6mn6hWt/GL610321Q2wl3w65q1tXR09ff3NfIuTgX6UsY+qg2snxjewZ3RZqdQG0z+H71fLmrKfC+V0GTMDDsqJnXxU5VbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158298; c=relaxed/simple;
	bh=w2z0HHii2SMv4uUccgDhOtlZ+feJu0u3Sq+xhVxAYLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEYELwNUU/hljRsjqxdItP27wjy/pLQRax/m73HcEkuu0CY992bare1YKtzLcqFzgtYUKKzl69wdtpOgjK2aRVnUY9u2zSz5LRacv+u//MVBO93CkSupG88Wla2Z6ucn31co/j8GBXN/9mIvggMUqYWV9ortkxwyZ+2+tf7buQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCSH7Fo6; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCSH7Fo6"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70a338b1ce5so55405347b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747158295; x=1747763095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUCt8KSDCvhshah6qr6Bpel3fuTHv9aZH/xPAsacK1k=;
        b=OCSH7Fo6e6jdihQkC9i04k8vihuO0r7Vgz55LlUd6irytwFv66CUXY8MJUa9cjytEb
         2ceh9bebPO5Hellr6dyylhDUgLPo+bPlhs/wXScvfFYQnmxWFPiE18IR3UO1yUgEx+ca
         gJGL8GuQjcybfxiN583VyvZJvxsf7qEydJ5m79dH1hVwMn/pz7OZOZ1xB30vyJXVknqW
         KTBiNjIy5/z4s/NCif7p5jIaabjlZpT/vCAltkUeTqi4FtB7R4hIpicCJFP8BpFwHPvl
         1Gih6S37elW43EUdcCMF8U583Wa/BCfi0rKaXjNtMLKipfM6xhc0inMsC2Zgv7bYsDKd
         dXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747158295; x=1747763095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUCt8KSDCvhshah6qr6Bpel3fuTHv9aZH/xPAsacK1k=;
        b=DnIcQh2ljxT8KW41uRMIZJbKhtuQF1TcEJChmqryxChpPBWM6xcfYJGqq9nvYiKFDV
         2fgs9V/UtSp+YH9pms57Z/GqWSDWPbH8nNVnU0HCa4RfxcmDy78ioG8/oXTUWMfKX+tC
         oo8JURGilMib05zlmKXElhro5NyJ4KRNPbGn2wQ0+kh9CK+bX8Z3+1jj1CxbK00aph+w
         /i7NKsLjhtppx9YAUPfXweZ4g5s7aiyD6h4TGqMsZVmCaBaIEPwIbR2sM211weRYI7kZ
         j1sxL+zjTzWAvz/QW9WnxU107bKsjKFsefbq8Qpimx2oPFdIoNhoqdOaS/5n9UpNOIpc
         ZZcw==
X-Forwarded-Encrypted: i=1; AJvYcCUAwN31kg6hJMCTB5nZg3Zx+WSlbvo3ycfm5rImov6slhZt/s+j6AB6qEn757IRItVskXD7AATVvpUVgp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVE37HY6I9sV23/m5Ci50d1BSuaievgnpGtEYjVKdkjLbhoWrt
	SxYcr993TBjZ9gUc/q7WC0dkqQYjUeFwNv661irxRreI8i8QyYe/
X-Gm-Gg: ASbGncuczAiQ61Z5AHABmnxtpwX9h649KOqqejib0PcINI16CijdWEsIAcYddivpmyT
	/xajUcWIAxC+U0g1wHq+NhmVXsVPKyEHPG/Jhnm8UjHOwOgKbr8UffasEY5TrfVR2cn/kH3Oycz
	tIM0qC4HrJFeycp6rS2vp6VWGrl0zARqFDJlPRxULbTEIIdFGklP3UUPE+bvVbLhoM6ECXCXJFB
	LCfcrss7KWERU7k/AG2VOgIokfV/f3he8RX0owYGexxNt7+za2VmXcfHA0+ohCUBeQhdYUgJvQW
	0lunmliLK7WkdHQRTzujum3z1A3oiRUE4GZcHOHgpQzu/0xEvpW5v47s2ClHrg==
X-Google-Smtp-Source: AGHT+IGj8zaP0gdEup6f4OZIiRUz6+qYKhNTvxWbEdMhhopmD0QU+21LzEyugiSVMtLwFjHTmSwEKQ==
X-Received: by 2002:a05:690c:c08:b0:706:cafa:3ec6 with SMTP id 00721157ae682-70c7f10a80emr7746617b3.6.1747158295565;
        Tue, 13 May 2025 10:44:55 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70a3d89a2cfsm25370927b3.12.2025.05.13.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 10:44:55 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Date: Tue, 13 May 2025 10:44:49 -0700
Message-ID: <20250513174453.4153130-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 May 2025 17:00:07 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> 
> REVIEWERS NOTES:
> 
> I took a look through git blame, past commits, etc. and came up with what
> seems to be a reasonable list of people here, if you don't feel you ought
> to be here, or if you feel anybody is missing (including yourself!) let me
> know :)
> 
> David has kindly already agreed to be co-maintainer for this section.
> 
>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 80aa09f2e735..29d73593038c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Alistair Popple <apopple@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>

Will do my best to review, thank you!
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> +R:	Rakie Kim <rakie.kim@sk.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0

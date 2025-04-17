Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA152522A4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901912; cv=none; b=FWRDJ36ZXVXVy6xm5rJKbgKgJHx5tucoLiVMIvAZZVSa4tE0g2ZwvjTsl6P3l1GF9tBVu9Z2WVu1dYifIvdKLtevUyQ4Ii50cCtnZvhCKKbh7Ez+7FUMfh0Xdhv4D6D8V/ReHt1wSvGXdhfNdp369EmcLJGh9iDeWMve3eBmyfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901912; c=relaxed/simple;
	bh=769yCdBlANwbmRIbTWde2f3Il2Ej+D8N39f2RDuMZf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnZIo4hwWn9NVCzuCLSgq3Fxs5pGWstfbCDC24RtOKi4X4Mtcu9hhwGfxcefDV3Fd8jhWCN23LnzhbmsxWPB83oaS979+KZu55E8mEZ0FCoGZAS5GjImqbsvPxpIeF3biODfobihUdnXLX+fqOxmnhVR6u3i9AyOpoUd2rn7dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=QhOpWc30; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="QhOpWc30"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c54b651310so111650485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744901908; x=1745506708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j3gbCW+iQwhJd4DkAbGAG43g6uYzMnLXJAizDgyDC2w=;
        b=QhOpWc30txO2afWq9hNHPiiyFQTWO5MP9nXWwQM8qAZjnRO6BJwSknzy6MLlEcqCfU
         ntaKNO3HCuBzwVVfPLG3IY+LLnxo+DzJkNTccTAjKP9I5V12B1D0ZkH4ni0AQCaRfbw3
         xj/uhcVcIZWwRJ8jGH3L2+0+2tCONw0g3czIPH/s2wA/xZzoUunqUOl6m+oibUfApd0C
         a5ydjgpjBJYvmpBlEavn2Qc3F51MDM0dPru1PbhdR1fbPXhNNCtezFe1GGt+cvsKuREX
         HKBbS9m/Zzl7mYL91tJM45faIWB4N8ModB1ekT0fhqcjmVSnRaQxAsmQJMuRtfFJseKN
         ISuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901908; x=1745506708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3gbCW+iQwhJd4DkAbGAG43g6uYzMnLXJAizDgyDC2w=;
        b=MIncFXwUxLgG4+Spc58iUeS9q+HPkKoZisqa8BWZfzfYNP0gZyTBW1zBjk3u6NEvIA
         mNyyv+8Fstg4t2smgBsd5fEjLBMLYVMQSwu+pCV3THA2PBjWKqVBer+AEPTUGe6czzoe
         7iTISW2QPa9CgxOcQTuvEWelTXrgGPpapaIq9axuf7600LEazVmVeRMGDqy4cBS5Yh4m
         xxgKAy4eBHTQ1pJs9vu0Zz5uKjWYVxPYaI5R/5h9UosC6iIqH/HJws8KJDP5oZwI6GnW
         Y/QUs1ufHGWpeAaf+P/6aWdTIuijM1QLp0k2JUkkDjD3m0aL4cQT6wbLVq+MLFj3YuZh
         gFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt3ux6bWC145LUAPsmXcxU1oJYjsGSfO/kZve/3yQUJ9rAwNY4/uWnSenRnkEL4JkeYd+iGmMxLFWElL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/tGgqRpXtlhkHxL5E5Xk/tmjSYw/N6xVVhohtLIwrfuGc0lJ
	8u5eftXH8z1vcnEKj14tkq83fuigW1pnEE5OvaPtsKmDdgQqsPw1MOgyM3QBjF8=
X-Gm-Gg: ASbGncvscGD53KvMWi4y2f60XLBkZB01r0WcxehvezdX7WLl0KB6t/uoTGIuTOSZiwK
	lEDht0b3HvuzkpdFEyhcXTR+DPVKmGKOdAOtGtWh/mp3GKPL+mxK6C/RI4/+75I01YF7TZRrDty
	c+pGWGpm2X3MktZll9Ld3rdT8x1zvTvim6kb8A5RRXCmVA9aGurpXr/66P6LssmjGd63KwRZ4k/
	wdV/7NEVXDQRKGl2HrOQSg1ph3CENgbt94gENj5VtZfuIn2inMfexWbnQysYluTOJZ/CGsfvCmZ
	jYJWJtg41KE2JIuz34c7oWs2DW6WKc3hAdptntg=
X-Google-Smtp-Source: AGHT+IG8pal8ArDJIAxk4zvmDxxTaWHTgc3rlYOQmxwiOrJrTtp4R4yKIBkfKdWD1Cu1lEd1pdGILQ==
X-Received: by 2002:a05:620a:472c:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7c918fcecfcmr833341285a.4.1744901907842;
        Thu, 17 Apr 2025 07:58:27 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c925a6ea26sm824585a.7.2025.04.17.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:58:27 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:58:26 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	david@fromorbit.com, zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev, nphamcs@gmail.com, chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: Re: [PATCH RFC 06/28] mm: thp: introduce folio_split_queue_lock and
 its variants
Message-ID: <20250417145826.GI780688@cmpxchg.org>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-7-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415024532.26632-7-songmuchun@bytedance.com>

On Tue, Apr 15, 2025 at 10:45:10AM +0800, Muchun Song wrote:
> In future memcg removal, the binding between a folio and a memcg may change,
> making the split lock within the memcg unstable when held.
> 
> A new approach is required to reparent the split queue to its parent. This
> patch starts introducing a unified way to acquire the split lock for future
> work.
> 
> It's a code-only refactoring with no functional changes.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99145221280
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883218; cv=none; b=DuNEolUU4qJIsqu9tS9RAnwwZTSv0luH6UpA263qVFYTHKl8An55Xh2FWd9u96iv1Mmo/lw20Cy49Tl3WotJ/P/RBaRgVQnN9uUX0MNBWdkfJCT2OVWRufgbzcCsESoHbcdaHll2cS/IFjI5bpW/n/abZJ/vWi65V98bEACmGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883218; c=relaxed/simple;
	bh=qfYGX5uf3SN2A72mhHtHMLZvVQ4BrJ7GbTCkW23d4dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEXVKad7TijfSHpGDw+MIrz+cFYf3zdCQFz/Sw3ufqhzPBMHlhAbEo7hH/IVre6uDOX5PD5jFROWlKEo4SJOwoj75QIMwm/5O+7Dg6xcIWA5Hk8KRpmfehPIi1MhbqOFcd+ocMD0ja/HBGo6MKyXgzqpnLdfI/LdHvvl+pf5oNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2mZsHDg; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2mZsHDg"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e812fc35985so1558546276.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748883215; x=1749488015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDHMuqo6RzMoJIRbVQT8ztx5HK0kzx4NSGfmPKbpaeM=;
        b=C2mZsHDgKGjj6xg5TokIyRXKDswfYeCwDzRjAGDeuRJ+Nl3zxNWcfKKxB+EGCF8hp9
         VhFS0lbNOjQBattHnG3ReGGpYjh8+gwccXK9DzGCg6BcOVjNypBq7iPMCgiXo2UgorRX
         MJWYi92UmiXR9ByBZA705Q1gFqItbglS1elyx89/m5p1cda7diTwCgYs3ZveUPGmb0KM
         rnyNvIEkf65DEWWiDyKg9dUaQuG7EFmzaUyQDiSK/FtGMM07YM1b8LU6V/7ctsJWGtp7
         CtZ/aGUK1J3Vslf2bCSqkFQiX5TjjIzaQsfa3knqe1K8Yyq4KlDOIGPgWncxCj+89ASx
         j49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748883215; x=1749488015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDHMuqo6RzMoJIRbVQT8ztx5HK0kzx4NSGfmPKbpaeM=;
        b=fhNi/wKQNcS9mTLy+b88NKahS4wE71veEoBHCpOnyIOJ80ggUxZutbOYRfUFbf7sj1
         Ah0Iw5/iqnFFE3MvyFR0tsm4kAJCe8vnuXi3mqQd/MKFpVBDqQggDFQmYrVq7cM8Gu7a
         X8xdrrhq0vdl2E5ux1s2YKeFNTQNMb+sSfMjBG2NBzVMr7/aswRXv2J8CNYL4uRiP9id
         sKC+FiHmEMJsWlBIXRqUky7HR2Linyi97tA7k8WSdzgTV5HSpuAG6Fxglc1mFPTGMhYz
         LXy8ZChI/Hp8x8fDgedDgno7mngr04qL5xRpGYFJd6lJVRR0EMASTGI5k/l3UwE3NUVb
         C6zA==
X-Forwarded-Encrypted: i=1; AJvYcCXQeT4VIGo91GprWK6bfntWyRpbIldt2NCA7QLdz1PWSogxMmeQoWEjpiJqwYCffaerNEWiJ1A5N2oZkeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQh/A0oHBLBBxIdnt3EPgmSDJPocYMDVSg23W42iqyJwXvDu66
	6tJ5vIsq7eL7R949B1INS3jcyk7XJ0KEtU5pDxS/9648mfRHhQrWtG1V
X-Gm-Gg: ASbGnctlJaQTiIyThyQgTIUYBsPEIjoKRpc5pnUoCUnqCjr/GBM2Y+b5/d8a7LddlEY
	UYJMKUV8ipQ8QH5NpPiCKW7ZHDsfIC/3a/8QPJ8GmSvPCsNpzWA42WcmHd8sX9111S1atjDF8qJ
	c7D9la7N4rtyUAGknllIBaxRgIQsv8D73bO/IPS/zl2ZCj5sC3MaedPDhB4cydOWm4pFF77yWCc
	vH1R8XpZzgfIIrHRcnDHO1Qo1O+5uo6FF5xqCr45VHTmQ6C7rVDvs3Y0DmCMAotPNLLA+BSYUcr
	iIJyreK6nA1Fe3kmj4l/JHX5m60+pcTkXTwvoYItkDptP2lXN/U=
X-Google-Smtp-Source: AGHT+IHn23nMGp0B35ZPqUDMayqPq1AMBdtqerU9zasbWOYSJSaq5D+zdFs6bGTN3Xvsede1apJ8jg==
X-Received: by 2002:a05:690c:6a02:b0:70e:142d:9c69 with SMTP id 00721157ae682-70f97f2f43emr206017637b3.31.1748883215244;
        Mon, 02 Jun 2025 09:53:35 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:72::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8abd6052sm21510437b3.24.2025.06.02.09.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:53:34 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Gregory Price <gourry@gourry.net>,
	David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] mm/mempolicy: Fix incorrect freeing of wi_kobj
Date: Mon,  2 Jun 2025 09:53:31 -0700
Message-ID: <20250602165332.2746843-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250602162345.2595696-1-joshua.hahnjy@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon,  2 Jun 2025 09:23:39 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> We should not free wi_group->wi_kobj here. In the error path of
> add_weighted_interleave_group() where this snippet is called from,
> kobj_{del, put} is immediately called right after this section. Thus,
> it is not only unnecessary but also incorrect to free it here. 
> 
Fixes: e341f9c3c841 ("mm/mempolicy: Weighted Interleave Auto-tuning")
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506011545.Fduxqxqj-lkp@intel.com/
> ---
>  mm/mempolicy.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 72fd72e156b1..3b1dfd08338b 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3708,15 +3708,13 @@ static void wi_state_free(void)
>  			lockdep_is_held(&wi_state_lock));
>  	if (!old_wi_state) {
>  		mutex_unlock(&wi_state_lock);
> -		goto out;
> +		return;
>  	}
>  
>  	rcu_assign_pointer(wi_state, NULL);
>  	mutex_unlock(&wi_state_lock);
>  	synchronize_rcu();
>  	kfree(old_wi_state);
> -out:
> -	kfree(&wi_group->wi_kobj);
>  }
>  
>  static struct kobj_attribute wi_auto_attr =
> -- 
> 2.47.1

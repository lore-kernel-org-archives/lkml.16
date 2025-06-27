Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36938DF9;
	Fri, 27 Jun 2025 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046882; cv=none; b=TMfB56RP7FxGjU1/3ls85kKBIoCfzQ78SVlDnCPurXZdk7FA9Esw88yx69G6iEl1LR+Llp9qXHa3UFnltKsdF2Ho+d3hi4Js1srf3ueF4WjeRO7VVH9PsnlvWZnW5a8tqW49KvQqxTu6h3xaaPcl1qG+pfmabKBj6ou7PcDT1nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046882; c=relaxed/simple;
	bh=FVi0DU+4tuln4keGuRB1pJeNt5frbuP4bsOxb/it8r4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfJSNH7afOqXKpVUY6NhWV9h/osNWAdHG27fT6z2sHeeAKi3q/ThPHdEtZ7bybA7f+yaM4CZsLDRB1tJtK5lLLWv2xCQBKgQOc3S4wCYguzz/8CrdkvXMRewbK7jMOCEeHoHrkImiWAJKOdh5arcOWLmzxuispD0aU6NVZJPb+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLGzzJ1w; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLGzzJ1w"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b9eb2299so3123340e87.0;
        Fri, 27 Jun 2025 10:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751046879; x=1751651679; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0YOmbfxhQh3WFWI52qUJ9nfvXhpETfAu/SYly/J66Y=;
        b=kLGzzJ1wroF4DPeAIel1Gvd+zCajtKV942ykeXfuT+vdqZLmWpt2/LdoacxqQbb/Yg
         1zAtDdUFvAvPnTGIzlIQuf1QEqSL8sh+o6yIT8KhtXPNNLkahFMmRXPcoliTwWK7Hc/w
         oU6v25nj90zxTxpBgn2AxmwXaYZLuei/sGsnhP6EfBCF81kEQytyTE6hGGOXhI/AfFZ5
         iRFnAn3Yugoygs9abozBrFpVsPZLStbWeXjEdY3g+Pt0nyV4AB7OSJJWQvJQAe/+U6wS
         Dgp7z6LkLRgLkFq9Td9AkhbZWdj4vckanGiUb3M5O96/d4HWNmXc3Ee/RV8BVEZLTssH
         6GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751046879; x=1751651679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0YOmbfxhQh3WFWI52qUJ9nfvXhpETfAu/SYly/J66Y=;
        b=sM+bJB9DM4yG1K7uW01ephxhsITKxTgLPiqcSUub2bxTBE+8eh0pbMZ0k0GKUla90u
         cXP/TAlb6TK7pHRkh98XHlrmp3V7gxKaUyi4eRMsWnUG9PAJhJp1OByxq1lNoPiZXWb1
         9CeiEKvWAnGOJDYZRDtkSW7FdRQ/tfw9nZeQRp0/ThPbCBqBEskvBUF1QcInpDV3fxc0
         j5Klrftw5qIqU7IDGzPn/PCk8RPb0YjMSiaz3zmv6gNqX3aB0i2/nmG7aVu4zxIGEn8B
         gNqbcFQWO5qbdF1Kq5slMFZGZ+rcw/L3h3OVVwmVeyPpM9VBfTzpKA5a8ojUYgL0Le1R
         x4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW0cjdI72GLnCuZu6SYtAzVfm7ZIPg+Ns4ljm3JwzMJKHrohW05AM+/tFbPCLznN53SzfxoyXQs1QFmjWeNPk8=@vger.kernel.org, AJvYcCWGnibKDsB/TAZGm2Ox5dozwvfI7TlSH2D6YjfZj02pKRSR50oXU0wgH+Un4/48uzKxp4CuUNdb1DsuOWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyweYgWqxUCgxQ5jCEwZMGS5xgqx8YfNc5CsHID8wFVWIQm+ZUN
	SIRhMP0Ih/PdcXJxBY3QjJEa8WZrCpJLc3L2ysAZTWqfQrmLqvc7swu/
X-Gm-Gg: ASbGnctvsfc2mhVZ7/9DfcEylx79mQONu7YiafdpGRQNsMuw0D2RTSqCcNj4C/+13vY
	kOwZn4XgfnBu3/2mXmtymg/o9Je5Na9WO4UvE9qcW+hfXkBrfaayC51hTlkC1G2TAmKgQzV/Pq6
	IqYtPS91XMPfkFj3RPEUbh1S0nhUxeuAqtQ7Mskcwl5xYthWgARFNbyaYBHrQbHdOdqxxoh6SnI
	HuZ3VRDZoI/UZgujP0aGyBa3UUSvtJjhdeXMBbE1Ukv0iUkFGPZyDncEdBCM0R0s2O7ts1ljLYJ
	W0XVhEaBfr0sUDCBEoXh99Gw6d0z7/cldW/X3i9/50Yb/aDAJoZNRfseHmmvpr81aen7T2tgrPI
	puxUVp6+Ahnk=
X-Google-Smtp-Source: AGHT+IG2QNA7AaHqhs/Jpn10zzFILx6zhTWKhedNqnHw6qS9jLTKQzs6R+hZswYcbG8dUKxLnApRmg==
X-Received: by 2002:a05:6512:3b9f:b0:553:b054:f4ba with SMTP id 2adb3069b0e04-5550c2f5c32mr1562749e87.12.1751046878569;
        Fri, 27 Jun 2025 10:54:38 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ddc50sm518754e87.231.2025.06.27.10.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 10:54:37 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 27 Jun 2025 19:54:35 +0200
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Uladzislau Rezki <urezki@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
	linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/4] mm/slub: allow to set node and align in k[v]realloc
Message-ID: <aF7a23G6zTtylrzq@pc636>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
 <20250627093714.402989-1-vitaly.wool@konsulko.se>
 <aF51PTZh0gRVFuYu@pollux>
 <aF6DmPmeSpWU3hH_@pc636>
 <C6331389-1008-4D8B-99AA-C2640671E9A2@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C6331389-1008-4D8B-99AA-C2640671E9A2@konsulko.se>

On Fri, Jun 27, 2025 at 02:01:23PM +0200, Vitaly Wool wrote:
> 
> 
> > On Jun 27, 2025, at 1:42 PM, Uladzislau Rezki <urezki@gmail.com> wrote:
> > 
> > Hello, Vitaly, Danilo.
> > 
> >> On Fri, Jun 27, 2025 at 11:37:14AM +0200, Vitaly Wool wrote:
> >>> Reimplement k[v]realloc_node() to be able to set node and
> >>> alignment should a user need to do so. In order to do that while
> >>> retaining the maximal backward compatibility, the following rules
> >>> are honored:
> >>> * kmalloc/kzalloc/krealloc remain unchanged
> >>> * kvmalloc/kvrealloc/kvcalloc remain unchanged
> >>> * kvrealloc remains unchanged
> >>> * kvrealloc_node is implemented as a new function taking align and
> >>>  NUMA id as extra parameters compared to kvrealloc.
> >>> * krealloc_node is implemented as a new function taking NUMA id
> >>>  as an extra parameter compared to krealloc
> >>> * kvmalloc_node/kvzalloc_node/kvcalloc_node get an extra parameter
> >>>  (alignment)
> >> 
> >> I see what you're doing here:
> >> 
> >> You created vrealloc_node_noprof() in the previous patch, taking the following
> >> arguments:
> >> 
> >> vrealloc_node_noprof(const void *p, size_t size,
> >>      unsigned long align,
> >>      gfp_t flags, int nid)
> >> 
> >> And now you're aligning the newly introduced krealloc_node() and
> >> kvrealloc_node() with that.
> >> 
> >> The idea for having an align argument on krealloc_node() simply is that it
> >> fails if the alignment requirement can't be fulfilled by the corresponding
> >> kmalloc bucket, such that we can fall back to vrealloc_node() in
> >> kvrealloc_node().
> >> 
> >> Generally, this makes sense to me.
> >> 
> >> However, now you consequently have to add the align argument to kvmalloc_node(),
> >> kvzalloc_node(), kvcalloc_node() as well.
> >> 
> >> This is what creates this huge diffstat changing all the users.
> >> 
> >> IMHO, the problem here was introduced already with vrealloc_node_noprof() taking
> >> an align argument in your previous patch, since now you have to adjust
> >> everything else to logically follow the same naming scheme.
> >> 
> >> Instead, I think you should introduce vrealloc_node_align(),
> >> 
> > I am probably missing something. Could you please clarify why do you
> > need the vrealloc_node_align() and other friends? Do you have users
> > which require vrealloc() or kvrealloc() to support nid and align from
> > Rust API point of view? 
> > 
> > 
> 
> Alignment for Rust allocators should generally be supported, it’s been listed as TODO for a while.
> Node awareness is very desirable for e.g. KVBox and for the coming zpool mapping.
> 
Thank you for clarification. The comment about TODO i saw. Initially i
thought that there is a real demand in having it for some users. But
this is just for future potential ones. So, maybe the comment should
be removed instead? But i do not have a strong opinion here.

vrealloc_node_align() sounds indeed better for that purpose.

--
Uladzislau Rezki

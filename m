Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86C73C01
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748504792; cv=none; b=QIwemGQ0kU2BVTcvHC1EkPQK1UiyLqf3Qv3L65g1KJYdWwG+hi7+D4yp5J3oEFYBab930WCbpLAgQAMMcQI8BcINxThJWaAkF4b2GIrwcHuAnbUbi/3W1fVmfThfUAUeX5edETPAp5OIjLKraQx8UQL1ImQaNN8kuKekN7q9usg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748504792; c=relaxed/simple;
	bh=j0jZi5gGSZZvDFcTErWC7L26+eOchtATCKhtWMxog2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWbWB/Jxp0tgPayQX6zlkryaOABdqnkztooWKldsgEVTRyZQs7kVUSQNIguJH4L5MSAP/hBv+XD50abdFORtAHF3HvJQIygkXrGthlwVNGyBA4u43UnbdatYXh+J9+rv3NTq8XW7SapJe1F2haM9am5osNeS3W8LwhPSVwLndjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HKpz4PNz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HKpz4PNz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450ce671a08so3951755e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748504788; x=1749109588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=syMy3AybDmsepOAGB746Telxh05y74Hp8pPs/HAKQr4=;
        b=HKpz4PNzdqQ/wS1aWKXyQve0o9h8o8tRnn2UpmgLhIy7fn/lSTP6scmZBQEueUNQYL
         4SNPlwmsX5hz5RUbANaz9aivatMBdfw1YnYTUCe2qZ0FrzX+TBsZbgwzZYC1Tknk0r85
         xumGblWXD2OAilTEN37GyFrCOZcEbjj6GnN1Wct7Esr/GKZT8DxUVEgUxctcUDHLWEWI
         H3VqTTajDt32sVgFTPhu5uqBXS+7SCXIxP+rpaWeu0Hz4mImEchNnSup1rGzpJarC02K
         uBRyBa1h2qhlSULbClzMdBKBGyPWGWriY9UaFVFk7qco/vKxUPDSbUxEpLW+MafXs7m4
         Nf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748504788; x=1749109588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syMy3AybDmsepOAGB746Telxh05y74Hp8pPs/HAKQr4=;
        b=WL/Jla4UDdaXuYRZTXonrNqZocMowMBHDJ8Z84bfw1cQ3FstvM7x+UkG1hoVAOny7A
         pjj5X8sgrnBqf79YddmVVIUfnEwMrb5OR0w4Z+Cj6bQFi0RGJoKszTg8zgp7FSZx9iMK
         ENLsIOCJVV0+mpTvMm1L7YL+yoQL+QJbfdd7VygTA6PmVfT7YqXQu4Npk4IM/HhK9RLS
         NlsIWP2lf8uwT7BK6WPYfFV6dULL6kG79zLGxERWhV0LZqgoArmAMkDQkGFAhZ77ej+z
         S+7kIJ5E2s/Su8lWWHGNW5X62Ly7I3urAXIgS1/pVQOxV8tF99k6O5KLm1cwhRia5vHs
         VtCw==
X-Forwarded-Encrypted: i=1; AJvYcCXy2B5NH12q38hYpY47abhur/AnzD+ojat5ltWi9M6HyWUs7kwAgAEu9o2/BnxaJ94q90O+F61J6NLpnlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX2ik8/9VfUt+Vc+BK4ZiG2UJcsywbwI/FnTxuCU7xAJXl5WRK
	k96mDZt41cBwfdUKd39H6rvrf+r2lCLhPuaP+AIRPNZOPbHam9dQ1+p6uiAPyZM5aMc=
X-Gm-Gg: ASbGncsOu+lYKV0PjdjCxyL2kUukPOhhB9gg3kKzKk7gGDHMb7p02IeM1ISJLfpEQ1y
	2QD4ApH6JqRcSK3Qx7MIB2J2wUmvORKJe6GT2eNLEIYx0+92yLt4D1zdMuki7z1ka3A7H1b/h1l
	I4gp8L1J95OHpHEMER4KPnDFA0ekmJ3QqQfUiyV66+WKeiY55UGKGgyrv3NgEic//5U6IoXxICl
	JcT8cfqYj8w0XxfITLsph2qNkgbCFlPWyJzaf+NJ0kRtrDxEG72O7EmMETJwHgg+MAKRIXGJJNp
	upvfe6Xktfu7PXbcSTsz2vSbjydx+hN0lEFJGs3lKKZEtk7NzTiLG3kcwCaEnttEXHg5yE7fbgY
	=
X-Google-Smtp-Source: AGHT+IFyyyh3PVIeEkj330p9rwCtHJl3rwnG9K5GL0tioS2pW1P5yNw5ZKlXbUTgPkuZMaMRVqGYmQ==
X-Received: by 2002:a05:600c:4592:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-44c92a549d2mr180964215e9.26.1748504787792;
        Thu, 29 May 2025 00:46:27 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4f0097205sm1148358f8f.79.2025.05.29.00.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 00:46:27 -0700 (PDT)
Date: Thu, 29 May 2025 09:46:26 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Jiri Bohac <jbohac@suse.cz>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDgQ0lbt1h5v0lgE@tiehlicka>
References: <Z7dc9Cd8KX3b_brB@dwarf.suse.cz>
 <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>

On Wed 28-05-25 23:01:04, David Hildenbrand wrote:
[...]
> I think we just have to be careful to document it properly -- especially the
> shortcomings and that this feature might become a problem in the future.
> Movable user-space page tables getting placed on CMA memory would probably
> not be a problem if we don't care about ... user-space data either way.

I think makedumpfile could refuse to capture a dump if userspace memory
is requested to enforce this.

> The whole "Direct I/O takes max 1s" part is a bit shaky. Maybe it could be
> configurable how long to wait? 10s is certainly "safer".

Quite honestly we will never know and rather than making this
configurable I would go with reasonably large. Couple of seconds
certainly do not matter for the kdump situations but I would go as far
as minutes.

-- 
Michal Hocko
SUSE Labs

Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA65215070
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 01:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744074763; cv=none; b=eZcrtTxq8LbKIpfa9sYU+8HV0I8s+20fLzD0Z3MCzmImiPZbCaRHMX597lpXVg+P9GsHBJn0p4m2MEvPZ0VMyoKI9cWaOpo3fPUv1G/VE/chU75EDRtxrBy9KN3oG1D1+XcDWlpWBPSLGrceStQz0K3DNAS95ZCPRnGrUV161Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744074763; c=relaxed/simple;
	bh=3cyuaVwWdfw8wiX2+gdBbwJBWaUrRysD12Ve9sazaHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6/fuOqaVOYwm1/ORq2ZTBm8frrFTS/DZGB4UjHkKp0yJ/QuIFq0icKuoVA41D72d+gMNsp+nzUsp4FHu/+crzTEFpf20KNr0t5scInLDW3ejPHa6XAVG9d2vajv77qEkNiDcI4EL/KAMv9gFYg2YXDiNWMXjjo1xojzrdikVMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=e8yAOH/M; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="e8yAOH/M"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c559b3eb0bso272522785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 18:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744074760; x=1744679560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AeWi0+ulUAwZ+I2W+g95O9R4Uet0Z3U0OznV/xW5Rs8=;
        b=e8yAOH/MPH5qys9/cHBhD51T8heS2fwbL+a3oo8EQMzrH6IpyRIZEtrtDLCveT18Ga
         /GbMe0CBheDOsqgWngXvVCO0jvmK2SWkWkqcOKkWm2PFvjN47i2Tz89edqC10WIAbnwC
         JviPtmCNMHG/MNg0ATLaXUJIts86Y8sTl/tW8Ux7xdpZ8/fiREZ85jQ5+4PskgP8/b+L
         kWXN0g+4E8FXDDBgWkrecVRM1owwtmqqlzagHFWyPUTh5mXwiB/m+HwbocPL8zFVHMTg
         LgtdVFvsIVpToPtO0O+DxQkmu03tvI16Y5OsIVmn1eK9YqZOyJmxhE2r30CaPYMZKFlf
         hxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744074760; x=1744679560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeWi0+ulUAwZ+I2W+g95O9R4Uet0Z3U0OznV/xW5Rs8=;
        b=SNr+8iu9or0rOeG4bgNWauQMBNSMsGSBgWXLvHYLClUlkBIj6Wv3SeqqCHyibGgTSZ
         ZLNLuE19TKginn34ad3dIr1xzuQLVXXi8+C1lDFJ4WkULdh3YkyqG+W5dNQftYJ8Azde
         8P0nAskCG2EHUUurHQ7fH1rrsjNOjF3BIealI4sB06BP6NJ2SxNYx5pTLsJEzhJQoF2p
         dV4RbQmqHpSkehWUP2YghNqSYRlUTa27hf9eYKBNorPdSF+R7r2jS1vdSn12QjlVX+KG
         WW6NEQ4jeu9dzwpdoXRmtUAMrmxDvd69ImRIIsXQBYTAnc+HB2RTrpXAxslw2LL4lzaX
         uCZw==
X-Forwarded-Encrypted: i=1; AJvYcCXIst9Kkk9lHrUIdzScrBDtCmaJ/qSYkV5990/+cr9aDcaszgYUNNm4n9Nw7NC1r+cxEqqTRVOx34i2Q5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwILSiZ7yKV710HUxxJGXbUEH388KLplMxpy98dXxLpLD7+heOt
	25IhIH1LI9XSFY0O6qTj4nxDLMD9hAAwCaQcYn4Ch+P6X0/hmwiGZQGJHokN3Wg=
X-Gm-Gg: ASbGnctnTQdExDOjKHrtC8gfUcpvXrAHiPoqfgZipFXE4peX5sA2zU1ImFaKVdHzahD
	wnoi3zt5UI74jPB8q6FAqWsFd8G10h2cgfD8F68HZZADjK/Y3RKee7yMpdbjv9gsSbDFAjriYKk
	UtKvhdrDChTgJ3SvAR6xnOJDMshwEi4nPbjmX6PuWMfYYJclJPeM2Fmm4q/HHpBn7jvxTKYzJBZ
	yST5pQEDAuFH2VlxLH6WdhueSaHyetxLTNBZmNIVRJgZ7ykpYpLCLaLbgIWyKPf8NEfdk+0Q4pj
	52fqHNCIKGtRQa7I1onwA8YldcaFz3cs0rXLnw+ZQzMXjV80BWA=
X-Google-Smtp-Source: AGHT+IFma74hoD9mX2PNK+fkQvtGYdhsMVrB1xrwT9dLrfDEGykLyd9A6oLqEBqlY+hrwP0UeQDiKg==
X-Received: by 2002:a05:620a:4081:b0:7c5:e2a0:4e64 with SMTP id af79cd13be357-7c775aeda15mr2188262985a.51.1744074760215;
        Mon, 07 Apr 2025 18:12:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:5501])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b15eda8sm69006201cf.81.2025.04.07.18.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:12:39 -0700 (PDT)
Date: Mon, 7 Apr 2025 20:12:37 -0500
From: Gregory Price <gourry@gourry.net>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: linux-cxl@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cxl/acpi: Verify CHBS length for CXL2.0
Message-ID: <Z_R4BfFNQ10Qh5yf@gourry-fedora-PF4VCD3F>
References: <20250407080217.76117-1-lizhijian@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407080217.76117-1-lizhijian@fujitsu.com>

On Mon, Apr 07, 2025 at 04:02:17PM +0800, Li Zhijian wrote:
> Per CXL Spec r3.1 Table 9-21, both CXL1.1 and CXL2.0 have defined their
> own length, verify it to avoid an invalid CHBS.
> 
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

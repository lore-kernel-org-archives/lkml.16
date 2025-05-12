Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41B6253B73;
	Mon, 12 May 2025 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068324; cv=none; b=j0X3hlrNUSqK+CyHREULo7p4BOahDLl8T1otKw8MiO3CbHs8l3w36CSSTVcE297kC7hdSysmjmtf3yreMKfahQOtRTbo0ZYOhE5LSRH/q8mRpnDaBodwsEZDTKKcPVw/XB278+AQLsfiqodziX0GCyTk2800B2nJmae/dK5DwaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068324; c=relaxed/simple;
	bh=G9uC19IB6B6f0yAjhFQ0OLv5o00h5/N5UucVN4+eq+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4Z0OXFhhDhTI6fZBJ0fyUPmmDpb4JR/gWR9ktNox9gn1pqKLmJJ1B+XgrXBxAVcQnsSR8C9D2juyK3i4DtzZU9XKFmYuqohlvXEcrUts+21uHYw3Y3MDPZbV/TJQ8hqq5jRWuH2MPuFyxbruk7gjw0P26/RfSmTf+XpVQMXFOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcSLFvsG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcSLFvsG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22fa47f295aso30549075ad.0;
        Mon, 12 May 2025 09:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747068322; x=1747673122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leb36LUt2vGzy5dxLVtm7d5Xfz424GGjA1cjDpH8X4o=;
        b=KcSLFvsGU+iTyRSPNXUOPV44JKNoFwkZxt8PBl0gfKVJbihWel6b8bcjNQhglAVWI2
         VJlouQBk+JOmwdiZ4Srs60aEzORVL1EUJXsMpifopL/im6xVd2uoqY8pY3/wxqx1igRY
         wQhEGu7qwdeNb8Kv9jD0qCA57KKcr2KWytLGnbjT20scwPtrEtNJZ3I/UpZzLwXgYiwd
         VcViIVkN56TdZ/lz7hWpgbWJCspz1F4eoxQTj7HcncZ3osCZuSuVL9ad/htcFilUvjjS
         ExS1t2wlXnJqh1q40BeHyr0hgKIzeq6PbkGeG1GS7paMPKGuk/LCkFBW7kKsNEiw6YYO
         fUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068322; x=1747673122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leb36LUt2vGzy5dxLVtm7d5Xfz424GGjA1cjDpH8X4o=;
        b=QDuyOH9oJqK7COCcj4+x0TyjGyIQ4g8QOkE3VRfJkez7XbQIpgcDae/GCib36hRlj7
         pWICnbAMR+C4tdQw8rYILvk5lh61qfhswd5W5Mk92O5GIhn/lcmZEfA8bCKP7KEq78fF
         EWeBlQ35R/C+yPYBrYxECT7TExqAAlz0vq8vi7HbuT6M/LDPb0m411k6FJXu70BeHHlg
         p9UjPOHlR+5FeB7LFgYG0qLLBV+PQcgGkBL5wcOsgvkcmikwWUnsQ9AIqEDPMrbhRjzv
         M2qJBFpKkeAMm2POZ3KpHGbnrAMCfuL8L7DGo5jlvCO2ykngVnzfPr4P4AoiwPg4VX/N
         +X9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9XjbE/GwFbHjS7lgNNXbjT+r6dSnnhPBLBG3+tWb1WfvE1yUi8CIPZVV/4gr/G/jZjKo3CYU6xtrC@vger.kernel.org, AJvYcCX1vJvA7neHetaz7ph3IhaKzVmTMFgsHcVRYlwc/isFaTq+x+IH8DKlS8K3w6+Q1Vw6pixssPMI840BiPFA@vger.kernel.org, AJvYcCXDDVcbeMisWhU4K9AxW5XP0+prXlrlYOavxP8+qdMspmpjAJJNpZQgafZ1JLLUbgHFk0NeXB/N4ziz@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDxOLKHZIAbTLmrCGkYzX6AB3J91jNEiK7In3euw5lAt/1wYy
	mRzrlr/838eBDIA8Cyzg/nRgc9Ji7BuObp9+Kg4Zz6HUA5fhfFOD
X-Gm-Gg: ASbGncuFfyInuvocOXjqVHWtnmMyLC/jUjhcan0KcliJolLw25hPs88vAzmPcinwW3j
	9R9MReVkqIaO+Uk2ttx2Pfn1GeO/1G3wQaB10r/VVipkLqJEKI64wum7WvTHmBnzQHIYN/VgKVe
	uWwfrP+TTB6puI3yROcgPjgNLaZ00CyO0mqg77y0v3Dt4/HuFUMbWVVJUZABy/no47j+n2zIQ7s
	HbbWiJuIWBc7fyqD9JlawUQHCY1kOwKs6rbnlK242TPktVCjImBbtJ4WgY1RCZpcRxc2oolG+9x
	1AG7cHDe05s1D2SUXmVtRA37SVRjvGs6B/iByFNro07zAlV6ecewgg5wgRoOsZKC
X-Google-Smtp-Source: AGHT+IF2x6rdoDlHR7WSudAXdT29fCwrnluQ58/3FaSNpzlwjKVeB6HYku6XzNHZuTMlPlBv6jL3SA==
X-Received: by 2002:a17:902:ecc2:b0:211:e812:3948 with SMTP id d9443c01a7336-22fc8946f85mr203102535ad.0.1747068321874;
        Mon, 12 May 2025 09:45:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75469d3sm65133225ad.41.2025.05.12.09.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:45:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:45:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 5/5] hwmon: pmbus: mpq8785: Add support for MPM3695
 family
Message-ID: <ac41da4c-d1e8-4648-9a4b-932e1fd50cb8@roeck-us.net>
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
 <20250511035701.2607947-6-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511035701.2607947-6-paweldembicki@gmail.com>

On Sun, May 11, 2025 at 05:55:48AM +0200, Pawel Dembicki wrote:
> Add support for the Monolithic Power Systems MPM3695 family.
> It contains four devices with suffixes: -10, -20, -25 and -100.
> The device is PMBus compliant and shares characteristics with the
> MPM82504.
> 
> MPM3695-25 has different VOLTAGE_SCALE_LOOP register size [11:0]
> and it needs to be separated because it will be configured in the next
> commit.
> 
> Tested with device tree based matching (MPM3695-10).
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Aplied, after updating above statement about MPM3695-25 and the next commit.

Thanks,
Guenter

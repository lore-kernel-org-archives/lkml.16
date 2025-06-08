Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F53BA3F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 01:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749344673; cv=none; b=Pt7nTXfZlVyeWJRxhF/ODi6pvbJ5/kxMuxcq+KdGb2L2zKX7HFlbhS90NHywIXkmMbgjg2zDybZz8QN8++JQwOqAwzRARWsvt6tny6Tqr+OL8fAeowQBYp4TYGWec1IQaSEdg1CdUmuPax1BaUw4WjEfkNIQjKiCYZNtjqfDNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749344673; c=relaxed/simple;
	bh=JO9cJwyQv1zCD2lXY3XoP4YZa+lf2r7pezb6iG6l8/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hd+xFAg1J7vX1D2SBjGYxLFZDalQ3BNIjQmQ/D9sENpsmKAqpqz11gk6R65I/6qQFfQh2tKHF7EspjzrU7i5qI72tI8OOM/7+dx9iSiZ4sXjqSu4InSxhQtfrW7gcR3cYStLB/bcFLZAJJbdM36huTi3vwqyz9SbToWS+4ECZuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzQSchI3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzQSchI3"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c73f82dfso2575547b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 18:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749344670; x=1749949470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=san6EgIA1IstcXSeExt9z2VEoKgDpmi06XvXrnY50cw=;
        b=XzQSchI3AHqhqTxe1Rsu6J0eriezjTypgtexc/o/PGa4HtHOSxckLACFoms0Mj+glK
         +Nez0ywDh1do+qygMJy6bQ8KWz5Ed3L3cXLmZr5djwBMir2Jjh9Hd1+vGK+RSn7FzIxh
         4EaMhk/X6NnLmb7wRu1I2/oR/hd7Ek6+PG4QUSXk8eFACahkK0SzD3Y9uEo/a/zivLXo
         v2uyc9EiTZWUVDtzu6qdHCPUJ9w5mtLqFQ31Sq6WRNeO8xJObN4/6LfpgmWyjQKtxugO
         /DwiVu4aIIDAP21l4d1nAwQ75+iD5iquDtZspt2z1KiWxJBB5TjSdqXXRlC8Pjo+Oji0
         ZqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749344670; x=1749949470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=san6EgIA1IstcXSeExt9z2VEoKgDpmi06XvXrnY50cw=;
        b=ZKKkwV+ClB6YvD/MjQOUiEKiPWAlbzKgCupm6LFPACsHy1meFnJYtdbjd6eSqVuX82
         owKibfV9IXXe+oqDr25Dhouk6hWTjmSI9g92VNF2jfNzzySi6va3vNKtFGoklwuE2huY
         uM8Q8/m8oj/natLOmt17ULFrdZOGyQ8E/FIlNeAJL0ttJR6171mOyTFC87tb9Q58Up0a
         FuKjImrO2ko2QNipn7QV76vBnlu23xiqd+4jVX3oOtr8w2ZdSOTQ5UKsMZdqEydhl1m8
         Cq7O/1rYR/cwAg6R+bGdhzJCZXyo92xGtQmBc3VYaWV0kwAuUz7Gu+2TJoIZtkkNFNxg
         gf9w==
X-Forwarded-Encrypted: i=1; AJvYcCUrjRZPjuNQZ30vwB7s5O8L9RbWJv+xAWYmkzwibQXt357tKllSc0xSYVmEIy6WdsiU5fINRSLcc2YapFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP4rT5GgJ8eDU4pqS/qJUQpplLbggtcOb7m6Xbx6M7KPP8Zj/y
	byCt/AXW5zM4N+mMkRUBDr/eShtMrVmCmtHIWu4NrfjPFpT2LzbGgop1
X-Gm-Gg: ASbGncvp+oPC9sS4HdL7ndRx7rDoY7Bq37kgfoZilH+fX/jYm04hl4a7eSRwwp/nwx5
	H4xCMy3vFj3QflTAMaSUm3drqxXBW/1NjLsHqcWO6VXN47E3yX42M8oineCC/xzhah0qvO83mNN
	6D9ayxkC+dAijzBBNuAkZkpByoNUqqZd6jdmRinB/G/mHo7N5weU4K3VDihkPMtTSWo5RgwU/0D
	ZMuEGnr5xrfcwkx4qruVELjg46s9XOFl3a3xGxJ0BetsUgTnuMHGY6q3hiz/kKqXV+QFsEKTG/w
	ZAj2fRl0G5bQQ3taQZHlB7/cNdCarCVGNZhV8nZ+zzD+XkvMIZdIqWBYdMhVIDWpIv8kSDMk4tk
	=
X-Google-Smtp-Source: AGHT+IHT+bqzJmd9l7kKFwCcX3st0MUeXc3AL4tTu8d426WHVHLBuWjnNHUStZbNmErFqYlMkXFepA==
X-Received: by 2002:a05:6a21:6da4:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-21ee2628a02mr12992970637.30.1749344670486;
        Sat, 07 Jun 2025 18:04:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c00d5sm3298054b3a.120.2025.06.07.18.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 18:04:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 7 Jun 2025 18:04:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
Message-ID: <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407075400.1113177-2-linchengming884@gmail.com>

Hi,

On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Many flash devices share the same ID but have different part numbers.
> To avoid confusion, the part number field is removed.
> 
> Additionally, since SFDP already provides size information and
> functionality covered by no_sfdp_flags, these fields are also removed.
> 
> Furthermore, when 4-byte address instruction table is available,
> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

With this patch in place, some of my qemu tests no longer recognize the
flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
this other than avoiding Macronix flash chips when working with qemu ?

Thanks,
Guenter

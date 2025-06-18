Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DCF2EFD83
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750260105; cv=none; b=N+0VrHJbTmqlrS/AAsbOrq+tLPCC/Ekqi5bfXMHb6jw1EwN5qRaO0dfw/toRKoA7wbtmE4bjdN4bQHiUyLKIh7GIt2xaFqJw1TWsb3WClcUxR/L2TspCb7Yfnp0LhlfoPhofHLDZeTL8yopsh63d8wMmnOqqUIuTo99cduby0xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750260105; c=relaxed/simple;
	bh=g07THXNWgAdEHWIqoiEHlcfwthoxZVyVXkEAgRexV0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii0O0fxNsK4jM/lEdAT6u9sdfKi61jO3xtjqbOY8YR5MO6EFYBt+MhV/B7zf2sISdXAy7jkfhxow/X+y/woL/MffGppmoW7O+Bk18aZEln9Kf/8yPegIJyoDHfiYnqeKtgz1LqUrh+BV275iHsf6frReVHRtTTap5BdHO+iQfl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r3rKuG+x; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3rKuG+x"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4091180d3e5so3378207b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750260102; x=1750864902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9AxwiK4VYo3D71UIHkicDqC7/83I7Lbnvvk8W3WY5b4=;
        b=r3rKuG+xt/6fjUipvT17u93EVUlVMjQfpT7D05ucLAMebOFy9CQU5VMPaRb0oi7TqG
         ObTwduvkwcmOdPoXYIZ7v00uhzdYrqBkS7gPWCG7HUEgSePqKFIyPD6bfYossU3Uiy8h
         Ym/CawwMPi5XR2Fes6RHUXQGdzg7znAYpWbsEvvxibHpwhVgmD6+irjzgWqp45gVRzko
         +ATEuaEd231fsiA5Taog/NIImPA9KgXcl0O7UhCVqPTjjW1IvyGS88dp8pd4S2gQBMLK
         Pnl7CbNM3RSZ2EHZsVoSM8/wbuWl+tmm414+raqdpIV3s4CsLhJzvlrNRfzSLyNj6bJa
         DUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750260102; x=1750864902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AxwiK4VYo3D71UIHkicDqC7/83I7Lbnvvk8W3WY5b4=;
        b=VW2eQ2wZTN5lLxQmCnsJeSxlCu2ch9trCCWyWOV1c211OCVdyUUp5IQ7aVNKUP257+
         +XslRw108BQvoKSQ+PUS8sruMA72lCk8w3Zn1KcHjzV5XzIhwyaeua/+Ouqxjv9QL3dd
         7+i8e7bZBZ9k5FTyQ9Ps2P1ERJqFVejKNiIfKDEuJC0jODGaaHsNDDfQPT5cx9nFxdQN
         wbuJBQNqIH+MxAgN1mCmwir0uMLo3HRKnjVXjnTu2WlsrBH9MzMRAVzCfOO1bgYt12jm
         jaIYUKjNvMFxv2EH8Vj/mfwKgP8JVAw0DJvdR77BfY+D9fjhGQBZCX2LoGP6x3uD91ig
         Wpcg==
X-Forwarded-Encrypted: i=1; AJvYcCXe72YLAzn4S4U5AReVtSK0iiNC1n3z2x28TEARMM9oLgWKB9qTpfiwhmDsK6n7wrnSdaVNi4zFpaKkhp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGE5Ud8d133jwkvpdtuuWBWJrqv+Stv2uKYcjI0pka2cWtrzHf
	yG764KOyOOJiTn6OJI69BcqrNyF2YSs2MjGPHYn6pkvwJVJrAhN5inuGOtoJ1R/uCpg=
X-Gm-Gg: ASbGnctZIJ+ZxQ+UDcpW9lNSCqRh0lCMqYYf8IlXIHpbEJrp820C2+M7bevHSgDpIjT
	33WqsoQK7d939+WOYoIQeXkZVb+wNy0dyTIsKZLh7gT/nvulI1quzZoZFsS8nYzMv10e5/BdyH2
	Zvls1ddFOtkbZv5Cu66LeeaxgtXgpu8HAyaOLkDnkJBArBUFASmyBQ+MxpxfpPmLpx3XonJVlh7
	ewK5LSthlgmyWwQqNAr0cpm73m7s6KhQHwxm17iZ7Wb3K141doe8+CvliA1T6fszQtSMfo51OjA
	XGl96uHQH4NpKNCljs9ly2ykKIi8REDoQ6sJekPuXHzJw1rSOyW3jt9tbTG7xIUcEXw8eA==
X-Google-Smtp-Source: AGHT+IGrf/owYOZYoHFe51D4S6Sh3ECbMUim7WjOpYzkcX3/wGxlPvEhosTHB9TtV8xPJwEvEZoZLA==
X-Received: by 2002:a05:6808:238a:b0:3f6:a1f8:ce3 with SMTP id 5614622812f47-40a7c1160b3mr10691931b6e.14.1750260102438;
        Wed, 18 Jun 2025 08:21:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b8588sm2371576b6e.49.2025.06.18.08.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 08:21:40 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:21:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: rafael@kernel.org, lenb@kernel.org, james.morse@arm.com,
	tony.luck@intel.com, bp@alien8.de, kees@kernel.org,
	gustavoars@kernel.org, Jonathan.Cameron@huawei.com,
	sudeep.holla@arm.com, jonathanh@nvidia.com,
	u.kleine-koenig@baylibre.com, viro@zeniv.linux.org.uk,
	ira.weiny@intel.com, alison.schofield@intel.com,
	dan.j.williams@intel.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, dave.jiang@intel.com,
	Benjamin.Cheatham@amd.com, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v9 5/7] ACPI: APEI: EINJ: Create debugfs files to enter
 device id and syndrome
Message-ID: <3a143d53-8731-4afc-9117-bac49ea96db1@suswa.mountain>
References: <20250612231327.84360-1-zaidal@os.amperecomputing.com>
 <20250612231327.84360-6-zaidal@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612231327.84360-6-zaidal@os.amperecomputing.com>

On Thu, Jun 12, 2025 at 04:13:25PM -0700, Zaid Alali wrote:
> +static ssize_t u128_read(struct file *f, char __user *buf, size_t count, loff_t *off)
> +{
> +	char output[2 * COMPONENT_LEN + 1];
> +	u8 *data = f->f_inode->i_private;
> +	int i;
> +
> +	if (*off >= sizeof(output))
> +		return 0;

No need for this check.  simple_read_from_buffer() will do the
right thing.

regards,
dan carpenter

> +
> +	for (i = 0; i < COMPONENT_LEN; i++)
> +		sprintf(output + 2 * i, "%.02x", data[COMPONENT_LEN - i - 1]);
> +	output[2 * COMPONENT_LEN] = '\n';
> +
> +	return simple_read_from_buffer(buf, count, off, output, sizeof(output));
> +}


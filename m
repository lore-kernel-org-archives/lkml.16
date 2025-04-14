Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140428BA94;
	Mon, 14 Apr 2025 18:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656277; cv=none; b=gnpdGPoPaNFRncLsjMJosqh5HMk/s267gfPfFr5qyIOhKfh2+zLHcctafGMvnujW8HduG2w6ZhUMpV+EvvOV8UEqcqgGD01g5ljk9TYEHRHTUJq1ILC/p9Lo2TI2O58iAgQHB+OdXRPOt7t0uzceH+e27q41N/JDtkyFRlZDG9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656277; c=relaxed/simple;
	bh=T6Vqv70iMKdORtZ3xvIEWUmzq7O/EJ2rbp0os+S8LmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3vKjwNqDOmOGKwqNzpeo/XaDswzNeMHOlZTABq6/NyrHXs6WETq4fQWPvLu3TwJ+GrCLH9FxeURrsC1+kzOFFKMscn8zF8zs0U3Aa//lYMqmg9tU9fBy5FiX83L737QOW183tUXFsJsl0rweUps1rbR7Z409HbKsxCgRIJdJWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xjz5S8wS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xjz5S8wS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c277331eso5225023b3a.1;
        Mon, 14 Apr 2025 11:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744656274; x=1745261074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnxMoELOahgrrf87uu9kOtIMrQ7Dfug6b7AU8zBOH8E=;
        b=Xjz5S8wSi5bKeUjS1JiIlGWkcKC3TC7WDHy21Wem20KHCaiv1ar41+f1qC0e1fSTyz
         573zLmJOEW+mH5zsgmRMjBBH8LnWhl2szt5gZGYNCGNeKSn8BfyarMv0NHToHJGyKa/f
         IiELwCSsiH98ixNBP5Rr4v6VBiISAu0+jkOozKFOH2I48kV1SdVLjKgD+A3D/itYvepd
         2P9J+jc6qrMQ8dEupkqLrH8P9aPzxJgK6y2A4uO2KxauKsJwem2L2U4Oo28UMXC3C3H0
         P36Mbkzh4dGN5BMld+zbAzpQxJXvqIWXKgAwkKe5bjYFxqVsigzlpzzaw+7S8nAeB+nn
         zv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744656274; x=1745261074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnxMoELOahgrrf87uu9kOtIMrQ7Dfug6b7AU8zBOH8E=;
        b=eHUvSid8vGzbiolNyzC6mcOswx+ygJQdoqbZQBgqI+D1VM3/VkCUx//D7426DmQZgD
         V33bcCMsmbhCFughWuWIaxirdcDXJZ9JmdQ8w6AHqFmoI3jugZcL7PyDO7nw7Ab93qqa
         pTKF19POglW7SAS4AkWj8hUb/fqHRd0gbMtbLIg7MX/i7/L/55CYTWjVNcqfdNhLgFhh
         WLn3C3XN4U7+T5PlSfCQfUiN2/SQz6p7xNTTMa/dUsNCqOy5I64cayZbdRYULsyWowD/
         U+P4jXuJfxFxdKp9O2JMPP7UCu/hWJOHXjfKVnJmC8mQ79Wp48vl5XcyZ3ciSIQ+wOPC
         ahOw==
X-Forwarded-Encrypted: i=1; AJvYcCWEXzlrmy4y9rps1mhZdVtUgOdsViW4l67xosKquH+kmAMf4Ung+/CaDqH8lzg6KavebPdb2nHAyiJUgZRk@vger.kernel.org, AJvYcCWIxJ/OKvxXS1ua1vNkjeXuh264mQ+tIWXusz0uku7aPlIEWgLKjCWLFpW6daYrnZunzecn5pyMxUoESw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzTGFjBy5XmazDOyYhqOEMWJKC4S8q/OkGGRiotpUgcnfvVSg
	r0C/nXmAkN6E92Lr9KMIPUduJy8PKBS7FvExDd2ymnbg24efYqOD
X-Gm-Gg: ASbGncsLbUFKGQm2JfZrvW+Bw1RUlWhtckE4hdv7VYI4nLadR93puqA06iDSXsMBlGG
	N60WoQXtOEgG5P+krPuHDABBeSETuIBoEF6Od4olCFflIItSVn3w0v7VQpp5t8QgMX7DABpShBg
	TOl5TrqSJFfzMbPhdmRRXtbvJJE3e/gmrpK4xRRbRK3rzdB81xu9DAYHzvDZDiH05N5dkraSSKI
	ae8P6lr51T2k/7bn7NC6bFP6DWUG/oFT+ht4i4KJBMcy5fm6v8Gy+OHMcP6GbSvuNERoLeEBftE
	w1WdKc9ruDh83YJnKbkoPFFt/+HQzyN36BR8z4V7ws/mQzDCJoeXRQ==
X-Google-Smtp-Source: AGHT+IGoaNJg6oIVGq529bEr3wydNMJhP1EZNw3wE0remYHz8zCSqwqOUlTjvhCtoHJOcSoCvY6aHA==
X-Received: by 2002:a05:6a00:b8c:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-73c0c971fa3mr604040b3a.11.1744656274050;
        Mon, 14 Apr 2025 11:44:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23342f5sm7160165b3a.175.2025.04.14.11.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 11:44:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Apr 2025 11:44:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm90): Use to_delayed_work()
Message-ID: <49220581-fac9-45cc-a831-96e88329fe6d@roeck-us.net>
References: <20250414074739.3954203-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414074739.3954203-1-nichen@iscas.ac.cn>

On Mon, Apr 14, 2025 at 03:47:39PM +0800, Chen Ni wrote:
> Use to_delayed_work() instead of open-coding it.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Applied.

Guenter

Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEF72744D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734260; cv=none; b=QoVrNW0RpauQbNmZq83vXzsmIVSWjTUNBC1q0LzLeuieM6gOxwe61k6tPIwnd0Dch50804wPVu3jdRbaPDvVN5liDBfdubHCHNz7eorR4eKElLSmDE52x6wOVEzNvVmd6uXLXmIvcjmlA0/ztFGy8/BwnSJTxvZkVC5Ht8YCJTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734260; c=relaxed/simple;
	bh=I2l+YRHKLjqKbe16A3AeFOK21pur651z3E7JS1zKf0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQpCcTXJDZJi/lAt9nfb5SBnlg7PX190fyoFiIFtpT7OgJ0XEG/h4cIOoE9BHmY+zwcv8Pse0un2ZpYRi/SRCNrRt/hJAICWZ9faJP+58jXZbG460CVwIU4S3WUJJwJr2q3mGlvVxgZPWuwiBLI1FEfkry0mmTgC0hHqd+xLsb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/f+iwqn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/f+iwqn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so11252795e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749734256; x=1750339056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cM18rYl4OkBhTprKN8RdLn8jnxpvdseiRESNUfJz/xQ=;
        b=M/f+iwqnzic29XSZvPzUl7Kb69pl/EXqCIhzuMZ6gHVoX8kHxs/OsWHs71doMpnu+T
         Knt8yLBV8ELAE1P1CMFHUwg3+fat8zyvwJxP3HtYXYZ7d9dWaJAU7PrcGIGwzXYOXo7t
         hRMLcyvdlmeJ4eVUPyyhcf/GL380KInVsoISjDaMaWakVXZcpZnYk4BPMPelaiQJ0za0
         8gR6Hh0Ux9tfnoYibJZmN5HlUa+jb0iGp7Fv3FfvyV0pmksLGeBZVNijVmGLvf/ZogKC
         PNOr3sWQlLnpek/E4HIsOVHY0oFOrRvwnrMpUJMHhM982Y1kZefwzeSY60v1a4D6D7a7
         k3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734256; x=1750339056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cM18rYl4OkBhTprKN8RdLn8jnxpvdseiRESNUfJz/xQ=;
        b=uDPv3aOTXUqjm1V0cUa3uJidqNd1mdkCfBcnhwnX6sBsmsILC6hou0fzjt0EJ1sOmz
         zer7P0LW+xHhHMcEmkzNZ3eEgVoBJd6x4KFK4ku11Week0GDE3ApFiJ94+0rDCorSsuc
         v2S6SL7wJSn6t2NZijb1K2kb6zI3aFQFeiBKQpRfgPgF2+t14RdRQAehYGj4QuBb7Pzf
         tm3lP+YO7yw7X1Fc3vtVHlvx1evXF8c+1cASKcVClO645UVJU3O4ttMUrRrnNuHV1EGc
         4hBzWE/wqy643wHipscuovg8zir0iuwQncUqoxTE9G+FMgiKJq6lW6dJSYm9ukfXPYjr
         IIQw==
X-Forwarded-Encrypted: i=1; AJvYcCUZpRhuAXnJwjPAMLCxLbcsXqeeGMpoee0A54Jb+W2HtMD0IEdKDV8gXYKEUV4zd1ir0tbP0kfBTiaLcjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBapXvqg7gPfUsOxsP1moMUC/NEYicUiwfqAJfORLo00mEqAzj
	WDu+0jwBnDnMRQnr7Nu7snsQF/6Fu/BsE2VbyLBj2mw81EuAqDHON2ZpnnUF9Rx5pLc=
X-Gm-Gg: ASbGncuIttvW/Mh+160ZkoTDSQjN5acTa7REcV3Zpjr0D8v3o7CyEviUiTXQV+RQc0f
	zaDZwUWw3pDGGg3v9HpbSWsPSEjy1zHpLpYWEGEvoliO5mrSSNWBhrVRvDkHNlCVfco2MliystH
	H02V2ldlWtqclpqONv6CqbUBULpNEC7XwQnxoFCDm1IOvILMiOmmX61tDktstVqtEJrrlqTYkaY
	CdUXGd8FmBkKK9tt4Bfx5AYp1gRcegywm/Ofb+OzOn5HMx4mOV/LxUjw5sG2/ihrfJPEqFrfqmn
	QMFf1yuSt5Xv7hena9S4Jw2cq/iaXqVxUmLplTsB7WemdGacuhtiVxG2hWXeahMTHJ0=
X-Google-Smtp-Source: AGHT+IG7QeuR23ipMSQIY1OjE0Q56fCutzIBHYYbG/VZ6MUHiq7Srr7842KzuwhR16Y3GRED6OV1DQ==
X-Received: by 2002:a05:600c:1d0d:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-4532d2f4efemr29273255e9.15.1749734255932;
        Thu, 12 Jun 2025 06:17:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e13c187sm20888895e9.23.2025.06.12.06.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:17:35 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:17:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: miriam.rachel.korenblit@intel.com, arnd@arndb.de,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] wifi: iwlwifi: pcie: ensure RX_QUEUE_CB_SIZE fits
 bitfield for gcc-8|9
Message-ID: <aErTa9ews06Ry8QJ@stanley.mountain>
References: <20250612130719.3878754-1-anders.roxell@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612130719.3878754-1-anders.roxell@linaro.org>

On Thu, Jun 12, 2025 at 03:07:19PM +0200, Anders Roxell wrote:
> GCC-8 and GCC-9 emits a hard error when the value passed to
> `u32_encode_bits()`. These versions somehow think that
> RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)) is an out of bounds
> constant.  Open code this calculation using FIELD_PREP() to avoid this
> compile error.
> 
> error: call to '__field_overflow' declared with attribute error: value
> doesn't fit into mask
> 
> Fixes: b8eee90f0ba5 ("wifi: iwlwifi: cfg: unify num_rbds config")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYssasMnOE36xLH5m7ky4fKxbzN7kX5mEE7icnuu+0hGuQ@mail.gmail.com/
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


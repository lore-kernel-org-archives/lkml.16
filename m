Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7AC2153E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045472; cv=none; b=Ee7bt95PQEuz/AeJI16BngIkWsXA/g/ENqO54vn+LIRZqwdCPEmpwEPUEcVaOV0AP0nqquqsOjKH8dR9zn7VeiW23K1b9eoO+yq/HaSVXaBdIv0RyzxK2BFe2PsRg8LF+3TC6RMk5GIt0lea8XVK5K+QiTOivYOl8pA2Om6eKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045472; c=relaxed/simple;
	bh=TEVXWfkzN4Sm5qaLcloqUogYwQjhOEliSpddiWoWPfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byyg2OZQAN8MIF5imLz/YaiJD/GJaJ/Djudak+erxeVLYW87aey2vVQa48jOwlKrDdoq6y0EzszXTHfiIV3aQJxTGLaMC1ODEUtfoqP5dYTFPRE+1fWBY3Fd231LjOKsPGbw5jcxj61ZhLvEzyPPP+Mj87gaKxVRHIAPfb84kFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lb8WglVY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lb8WglVY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240aad70f2so12325ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744045470; x=1744650270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gagm9t8Nt0xiSGNoWNiHmWmk5HWOXftRwNkfM4OrqXc=;
        b=lb8WglVYNk6UbBOy7RF5DoPrOL7VeQET7gvn3v4w48EkbwHFvx8gbCH+/SzA6fUomc
         +IbfLM7V5/V13nQKvAVZq6t9YmRb3kMX8tFN/08Ss9ZynPHvS7PS2+R4Vut11Ojt3pz5
         fUD/xIs8bfJMKEZw90REtWN9PUifKpHRQHeLgklefFfiYhLlib0qT/Qh4TEr1t1YKXVd
         5Q9cLde1QZgW27OO5+KHFS5dzK8Ik7aKkAuL6OyFT3APFo0kf2d7ebXJ/W5+b2STHpz5
         AyDwsr4yFyVBpuM/E/KnVpjUdW8kXdE9bAVtn1Lwwuw5vBESEpf5paK3VeI7sAQcwR6u
         gUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744045470; x=1744650270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gagm9t8Nt0xiSGNoWNiHmWmk5HWOXftRwNkfM4OrqXc=;
        b=CZtRjOiZnlK0gHxECWS/jpQ/B6YNv1RAcxGH2SpfrcMKRjGPoK8kDfgkFJV5BzIZk7
         Falgp1iC3I/Vd0S7xC5evEobSQxbkxzhb8j7NeUmueMxioTVHAjM9E77CSIn4Wb3S+5B
         lq9kT0M7bcZ7FzBTyhsOkkB4VeA1OA780VwtNxFtBK1x+lA1z/UcTNZSlhJQw0oIcUCH
         AFCb/5SrLuNZ7m7INh9BoFXxWTo3+bla9f+aIyhd3bfmRXfXp05HNEdEKC3kZgF0lhJp
         tnLRpkXEFI9d46odMYqQX3xxEXDirpj2y4tI7aVEwiw733gD1/yVJRx16TxGwhdZBZzt
         ZhYA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ocVjxxMXj6s/srAkWCW79Avhl5OGVy8BaG8jbT8C9Jhl2U8/Wu2BfgQ3nF9+TN+O7mM33VgxHTVG+FU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbNJhOsEEbP7lh/5H/bRTwLOXD4iBgfOD2nvMtYbYvAg/6v3F
	12DSymuuBdOiu4NlTnI5u8rGoVwd0cpLBq/UfcSvx+1IvqD98Jv9d70CMv/tGg==
X-Gm-Gg: ASbGncsLYjSqUygfqiNjHWJV7QoPVXiyIw5szXltSyTbJMuh7E/3BxsbN8OCVu6mfyv
	4vTdO9VpAv7RA5knBkjwBFj8v1TEoMXxrMYIT86JkS57yD8JmwyA78P8cz4piVGXeG1h3veL7nL
	zmTGQOUqunKlrXqvjA32fLHHzcpnbkKQgHObOox1o7eDoIO7oCYzZcbxVzver/jtNAHt9STSVAr
	/pU14M7LgTwTNZckRjL+kUqT5zXxvPAK6QfqhhhUGqBEzM+AU22W4jmzk6x5vYyZIBg+nTeKY3Z
	k0f23wdqLRck7gg/1vmKMW1M/k2ZcO4h60AFPL1cEkgaVvayJJ89gfuiM/lAp8CHeU5djWjwRz/
	X4e+Q
X-Google-Smtp-Source: AGHT+IHd7SFT7r2o/aJa0enXDjaNA6uk6bjLYbWPG18I4bFHtr5Bu1V8dTdmgI/IysVg2+ZsnQuitQ==
X-Received: by 2002:a17:902:d312:b0:21b:b3c4:7e0a with SMTP id d9443c01a7336-22ab5e96d14mr242995ad.13.1744045469519;
        Mon, 07 Apr 2025 10:04:29 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41a65asm7518423a12.69.2025.04.07.10.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 10:04:28 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:04:17 +0000
From: Carlos Llamas <cmllamas@google.com>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v4] binder: use buffer offsets in debug logs
Message-ID: <Z_QFkUCccBHxYzLH@google.com>
References: <20250401202846.3510162-2-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401202846.3510162-2-ynaffit@google.com>

On Tue, Apr 01, 2025 at 08:28:46PM +0000, Tiffany Y. Yang wrote:
> Identify buffer addresses using vma offsets instead of full user
> addresses in debug logs or drop them if they are not useful.
> 
> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
> ---

Thanks Tiffany, this LGTM.

Acked-by: Carlos Llamas <cmllamas@google.com>

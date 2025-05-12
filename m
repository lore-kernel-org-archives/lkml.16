Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAFB251790;
	Mon, 12 May 2025 16:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067768; cv=none; b=VNzQWtMDMtjiOKxzZ+FJdRDnT1BTFW/bwQz8RRVvlxy9MWHZfec9dU8AFR1cyOPaXm5jiPkkOzF6RZ3AFNdMbwrlLSqw6wHt7lSJ3le9EH5Qe9ggnXLrSBvwzmFgDSDWA5jMsw6yJzRPYLimx3Kqtyp+U2X6y8W43QZoryrq27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067768; c=relaxed/simple;
	bh=+oLnHUG93VrYtm+JzGlk44JAJqEZhfux3FHJ7vo7F9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBV3071Z74OMtCr9vnZ+eUo1PsGcpid6b7oAiaQN+u0nuH1KhtbjFq/bEihLQ0Avp2UM5XnJHjiXi7JI/c+7Ep5nQQMXVdqDIreUU9Qkq5R1Q8NTrCmaITBKtcWSeoCFupRh4axt+0KIje8xZomjFpdmcfIMXGkC24UczXDEQb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNz5cALk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNz5cALk"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376e311086so6590623b3a.3;
        Mon, 12 May 2025 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747067765; x=1747672565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkcLSJJjn4RV6QfnFEv+xFUlnB5bES/+IrLrc1C2aW4=;
        b=TNz5cALkl4KgEI3HfFGYE0AKgcL0P659zfRj9SLyjXKaw3iWrcutHw5ElOmgHFGA1X
         +OHlEnT53gtUYbTIsBkz/Ku0l3udH/0wSwd8XC79wrwNL2lOhdRZWnZmqQWgtkkuu5Hf
         bnNxaRaxtwzDcFitazt3pJTj2PohDiVy6ydK32qeujNlsK2Z28nGGenJ7PsKRAdpfRvy
         yu3X/8x2Y89V8KqxVMnFhQ8I7o+uWk2RlgMjGCOByDgyYdNQ5iOGGkXVCi+wZSAYTqSv
         EK8wjHSmwsouUcNDnu0KJtt33xG+FzOmmwTQ0J5slRyTWrMtAG3kWvQJYjj3jnZZmJFm
         ubqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067765; x=1747672565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkcLSJJjn4RV6QfnFEv+xFUlnB5bES/+IrLrc1C2aW4=;
        b=aU7OxvtKgDQN28jFxURMBW2h0nctep9s7ysU97zFx8Ucl6KOUdWpOdRpsx7IX/bF9Q
         igo2rpXU3lsaHpbkpryGznrCczDmn/o/O/lYq0KKgC937ZVhC0xW3RE4Cflgefx23FXe
         dd8VmkhDVnNKc7dx7vnGuyG2BUAYhYJIupqKsHVxnGYkJ/MrgqU7L7dGn6KhKWZ1IHzf
         3U0wFyAhsljNZL88vGJS9/oyUmDMhQKLm+pV2HvtbA8/8X4DHX0lxMuenjgGOcck+LPq
         MVY9HN5vy2oDL6Yx4csR6QpVA/ycyqqc46Gm/w04lRlTLOVNqD4dHF54ZdOFgzszkXVC
         2ldA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Xme1fKSKKtEjtXy73vfQNxZNyKRSnnAvvHC4iRl6YmXK9zSrdzPuQ8ez3KfM/GuwtKP4RHY3tUSeiENh@vger.kernel.org, AJvYcCVZV93TE6iNCkC7pWTXOG623zyifSr+e1Vw7g0QcPeot8fCk2mh0NbbKYCreR1H2CDvoubZLaEYsnyh2g8=@vger.kernel.org, AJvYcCXqKUFH5OnOm30Ug7UXPZR9q6i0d28dbnbQIRjghzpRwcieVi6eX3nqv+GXIPi20cbdY/LNyaD5fBQQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDv9R3UcoIndQiEI2iasS4IsmdIqFt/1ZQktr0qo+45JTCOjQ7
	uQBuDq9NtqioAc32BUqZavWZShO9GPQosw9IXebRD3gVxcXUs7Z3
X-Gm-Gg: ASbGncvjE0ti8bGqPKzL/vDjZ04+kWjA/LeljDdJJ9RTkuj2KvwNNcWf2UNIf+lrnMw
	/Q48MnzbR6YnOMltRncMguAq2t2w3yXP+Re0Z7iQvpcMrxfG51KSbuVD2aY7uWAmND/cxrDsdM4
	6TncantqeIBbJZznGKsHOTh8mdYnYAIP0pk6p8cFcVKwFpGtBfq4rd0qJl9L4G2m5meE64vGNoB
	xv1ACG2oSv2III27hFFcBu0Ekzlen02uXzzz3KPflqkGh07AqdZge7GV5CtEktlgHemJBwzw34H
	mQcAr4Wlea3/jgSN5ITf9JF3mbq5xBp0U+gsKfZLq8y9Z6+rUmFsd+UwaJz5S7wx1D6KpHfX2qU
	=
X-Google-Smtp-Source: AGHT+IFvKrgkJMvA6GPikM0tBUvrngrdt05jV2F0xEaLrL/E+UoZf/97Fkr1YVsokmzaJ5uwWOotuA==
X-Received: by 2002:a05:6a00:17a7:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-7423bc128f2mr23532006b3a.8.1747067765125;
        Mon, 12 May 2025 09:36:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237761dfcsm6278553b3a.75.2025.05.12.09.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:36:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:36:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	christophe.jaillet@wanadoo.fr, derek.lin@silergycorp.com,
	miguel.lee@silergycorp.com, chris.ho@silergycorp.com,
	eason.liao@silergycorp.com
Subject: Re: [PATCH v7 4/4] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings
Message-ID: <3c72377e-47db-488f-be97-500314d33b3a@roeck-us.net>
References: <20250506053741.4837-1-wenliang202407@163.com>
 <20250506053741.4837-5-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506053741.4837-5-wenliang202407@163.com>

On Tue, May 06, 2025 at 01:37:41AM -0400, Wenliang Yan wrote:
> Add the sq52206 compatible to the ina2xx.yaml
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

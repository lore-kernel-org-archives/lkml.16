Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835A37160
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769458; cv=none; b=nuc5Gxyo3eHbxPnsp47HRX4dZHEjtuuTFm4brNkqgpicfNsiLa4S48ucaZAD79Bu2hu73JruwK+iZhIKKnakoR+tEsWepYDhYpisgmUHlGg87Tezk5UDRs8fKtKbW58xJaodMGOfNMN7WaSsPVKpgiCTtTIDuA8bJZLlCIyEoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769458; c=relaxed/simple;
	bh=6Adut7x6V6xQvTZtaeGcGI6AN8WxglbwfcIn/y0VqWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILEg4FmvZBhh+BDICUjyTAPC/0sF6uiXEA4D4jYsbaE7acOGNLhKzl2a8YwMGBxo4xnitMUW7KevHg8ygH9kkmf8hJuG4E/7Fd3iW9Le1pZ2JNHcZDBoqq9+FzME5788p31iuM8uEsblr0x5/xUxZyqYkVKWr/zYjlRLRtdP6po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xx/Z87BR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xx/Z87BR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21661be2c2dso118236475ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738769456; x=1739374256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqP3iK2lT7xQ0HRnqx334ocupkN/6HOvXfde+HjeQTU=;
        b=Xx/Z87BR/MHcGcT+Mg7fj28xx7qzab9ZPEsd68+LuTbqi0NPZXlmgMICSVrm5EQUtE
         6SzrgkD2IV2T3SawWs3fVPiCSFAZoYajMe06MpyRanuxW1rUxz0b5406RdffKa56zRxk
         54BaVMtnMWvrb9VxWVzek4k8Ypq488JLgvrNzMLGhYhtD2vBQsqOy9DTxLC+ONUOZ8v0
         f7hB4OgjSLMpo4kFojkOAEHtp+oN0TPwXdKnhH2C/HKqY7zTNQxaGjKltEm6/VXkQbPK
         /po6YS1SCcuhz/wr4eU0l9hGQsBh9xTuRpEXvrxuybGiSzJ1ZX8pa9YuzcUz3iG8WcU6
         ocvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769456; x=1739374256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqP3iK2lT7xQ0HRnqx334ocupkN/6HOvXfde+HjeQTU=;
        b=TEvpzOQtsm6jdto5Gn7AMdnaUQd2ku9iR6+7qLZA2dNSexVBha6xEkCeaphFtjepzE
         evd98DJj2yXde/VlWPboX0ywgSt2i1z9KxuyyLF9hfO4olrZNsPeVnZNLPHJNG0acJeQ
         vqAHJ24nYaG8vWPrRc39+HNv+XJyxCuL4sNDOGhVfkoJiKRD1Ydzn5QUMHbTzxyY4Ruy
         3VdpxhSUnNDe6P88IuJlX8W+YVxFwNQGcZ/FH/fW0ajDa7Ywkzs4SbMNkEzyGjF8W6F+
         sigfX1mJ/u5GbfiKFKZSKIYVf/7+O3Y3hjIgBEfe/ERlLs8xya08Vwdj9+hdf29IL7M1
         A/rw==
X-Forwarded-Encrypted: i=1; AJvYcCV+eD/7a52T+tv+4AY+NnEkasG3oLuD6gtl3CasX53d/7+fYTBOOwEhuq+fiq8X/Xgix5LnsDT462YWeB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsOq6mHCewcXBw+1mw51Ol5dVLUbBlg0iI74KAsbDxo2UsohDl
	1MGDRSnQIJkuo3hcO+x8A2n9a5QyA3Ql8Jm+pU1Jojymu+iVqHBJ
X-Gm-Gg: ASbGncsX/RQSgNh+Cud1OKN1/djZf3CTjth1cKSf/YosJ8eXgTAZPTLz51ZqxGtWVjB
	/Xng4FfWmqSBTpqud9YcOoA44rq4+hBWjnrvcRjDBwJ6v0LTj9utI9CopUVm4I7VNZ/nMxPqPKa
	+V7nBQnZtKpQv0BhZiEU38eYRq47v1FwQRfZBnr+02m6nd+vW2p0Zzl4dYZIoqNONa9I/UuUiTd
	y8vOivUiIyhSew+hZSqXKpPw4ROrm1Zpsu1oP+n6Cf89ndw2wVj8A806pK1rticbl2DJzgSBr7N
	dz/4MOeQ+0T/CX9y
X-Google-Smtp-Source: AGHT+IGiauQLaccp7xXJv3nsoyF82ye16u6U356Jl2t+EHAnlHeWDjmfMyQiES8VZARAFDHzEadvow==
X-Received: by 2002:a17:903:46d0:b0:21e:ffaf:8908 with SMTP id d9443c01a7336-21f17ecbd38mr57191675ad.34.1738769455588;
        Wed, 05 Feb 2025 07:30:55 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5c49:8415:dbd3:5f54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f191ee04csm15371165ad.250.2025.02.05.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:30:55 -0800 (PST)
Date: Wed, 5 Feb 2025 07:30:52 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH v2 26/45] Input: Switch to use hrtimer_setup()
Message-ID: <Z6OELFCP6lepaZbD@google.com>
References: <cover.1738746904.git.namcao@linutronix.de>
 <62db561622799dfc8d58682ca41b54e3f1ff6949.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62db561622799dfc8d58682ca41b54e3f1ff6949.1738746904.git.namcao@linutronix.de>

On Wed, Feb 05, 2025 at 11:46:14AM +0100, Nam Cao wrote:
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
> 
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
> 
> Patch was created by using Coccinelle.
> 
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied, thank you.

-- 
Dmitry

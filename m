Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9865143C61
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750131000; cv=none; b=p/Yo9nyPdFSELJYhVr256y0V25kSKJfWS6fGy4MBE933BKX5tpmBbJtvKjZR39rIlMZrpoUWP6HLUNBO09eu/xmUz5mr+PAaBF294H09Vnfanl+YSjgW3/lFoW1zmQuYJdkzpXfHex/uQiWISHqP7WUsBzGZxEEpufR1ycFquYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750131000; c=relaxed/simple;
	bh=yUjLj5dHFAp5s2XajRxukKnvBAY8lCZU277Bt4Hn2B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTXAdtudNwN/Ota9YAX/oqXzefpyAqEp6UFy7844Id5se1BMgdi967h2tSXnPtRVyXc4oRXBrR6/iOeEkPoOjZ9uXVpSp3CEi3uDSQ6BX6ZDDOosDKC6nfeZEI01nrbES6m4dRj2m1reYoSsTuNHJUFQg63QBn0CseZM8tEjNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ci8kuokl; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ci8kuokl"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ca5eba8cso94785ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750130998; x=1750735798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUqINV3rw8vfD2veAggpTZ6kVQqewNkg6mMiquBfyXs=;
        b=ci8kuoklzcVwQ2utLbPg8S9e5aVuLfX/HqVa3YhrTppp5HHi2ZWF3MF4KbEP8CJTAh
         xMwp8I9l8YmrCs2dUDdAU5K7J2Dq1mlykQZyeJdiSn5bVkxI2415o40b//bqprgph4IQ
         ZXpF4JKExwfuiv+rk4docBecS33/KRG4WpXa4ji396tuuJy6iL4O7N+L1gipnfiscmha
         IOXW38lqxuG3YBEd+oAkt0SULBeaoLPlDTph0xpmDZO6+9eEtkUSofaNL1O3caqCj5rn
         g8PcxcZMUtY3OrTZdADv6rej8n3oFUEMMB4QW4cheyvv8BifhT8f4pkcZ6rRYcGmqrPm
         NAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750130998; x=1750735798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUqINV3rw8vfD2veAggpTZ6kVQqewNkg6mMiquBfyXs=;
        b=pGUY2HbPtFnnW5HQ9aq11MW78okKnyNWnzvlT12Y9u075ag6dpg/LS0Ell3tVXReYm
         z9K7A7vAijL4VD8ZHzJXOxItbJIo4V4rX8VrtvBz92sKQPV7TZQcgMfiMihueLan5dsZ
         DESMEsm2cCemtvf4TfZc9+nBW74IeJzehDboelr0zyXxkCg0B8lhHRYxAzF0sSCopdBx
         BKQJzCRuFE7mzVvFUcZvvbT4iulfZAXdGHbngKSoYNpYPoXZFIDAVN53qzH6XUiQ6xBJ
         7RiDcskTeIGQKg5w4eCG1LF4h98Bw7B9VdLw38V3uPfqyWorbJTM4GxqNcPEHkA2c/60
         +4jw==
X-Gm-Message-State: AOJu0Yxh0mZ3gB4GVBvo/dop6h1WNKpme48YXTWDsu64r/DUAR3bjgAk
	4gpGqYkqvaQh5x0/jukfZYJYrnzU7v3sFPvohnzUr61WZmM+br24yKRQHkzoLYr0pw==
X-Gm-Gg: ASbGncuqAlcYwlq3ZGGP+8Y2EZfezyTtYB/2OxaSyHTkk0boOlZZ9srL4OObFvGT+X6
	D/6Tc7nv9L3dT6Cbxtc5vH8W5TGmz8p8bRJD6yIPXkQ3WEXhRKcBNl6QDyucWMF2OHZfxK8x/VQ
	OTwBId17iii30egWl7KLaDWXFdBn2s/7Cs+VplXs4g7iPZ8DJzGRX1MT2pgAbru7iWCQIGEOI+b
	gTvxUTUxtH3ODUeWerlAt1wRpnDvMhgWE0T+Z1Gh06ueazUXvPLVNzE4dOWlGHFv82ikMKarJ7e
	nI4Jza4lvorSYALEFAc3qIHvNHEypjayeV7R+iP+zTuTiIdpVrWj96ccCC3lOobOZcKerncMuok
	4qPX6W+3qfXv41YYP0DFbxeJVcNrTpPiACRUSvA==
X-Google-Smtp-Source: AGHT+IHiDCwavgLhAVfK+Sm64NCnqWHuip3kUbYnXShrwNbzo/IsVxNbWKDXEl3n55X7VrEHzCOV/A==
X-Received: by 2002:a17:902:cacc:b0:236:9402:a610 with SMTP id d9443c01a7336-2369402aadfmr323735ad.22.1750130997870;
        Mon, 16 Jun 2025 20:29:57 -0700 (PDT)
Received: from google.com (137.184.125.34.bc.googleusercontent.com. [34.125.184.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b2b545sm9464790a91.0.2025.06.16.20.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 20:29:57 -0700 (PDT)
Date: Tue, 17 Jun 2025 03:29:52 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH] binder: Remove unused binder lock events
Message-ID: <aFDhMCoPsf7O1oHc@google.com>
References: <20250612093408.3b7320fa@batman.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612093408.3b7320fa@batman.local.home>

On Thu, Jun 12, 2025 at 09:34:08AM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> Trace events can take up to 5K each when they are defined, regardless if
> they are used or not. The binder lock events: binder_lock, binder_locked
> and binder_unlock are no longer used.
> 
> Remove them.
> 
> Fixes: a60b890f607d ("binder: remove global binder lock")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---

Thanks Steven!

Acked-by: Carlos Llamas <cmllamas@google.com>

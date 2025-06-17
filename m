Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A2293B53
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152063; cv=none; b=gtwXG3TO5hMpYuvDFIpgcwOHchjDvjtGnzUlOzUtLT2lEuGcn2jCwTlkwO4MzH0Y5lVD8UwnJ+YbqZYGAF+S85PfeXu3898h7fXN9T0uF/+4PpD94jKMXx9IfTYY3KUpMLBsdPpDRTxTCMhlzN5V5Yq+FvjjAOOsJuwh3+ABAFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152063; c=relaxed/simple;
	bh=z5I7vKGXCxYOyEzWu2JJhqtybnPdzC+8Wegi8VKSOe4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ey6L9BpV3q5lFb/CZmBYSao1qAO4hCwY5QLJOKULJSK+eN+B+46zS4oqosquVt33pvkzYPLTEgJiJDWipgxPwBm+OH9s0tsL2gtrI7KJCdW/cDpSeK+QdSWIbt7kMkvAyTEpO/ObAA+8SCwJJ/zS5yB717QlaiKffDGCkbvRi6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JC3FBRcB; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JC3FBRcB"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so3290461f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750152060; x=1750756860; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=782eKPHUPR9W1CknMJSaYhpUhMv8eFo5fzTvocEbp4s=;
        b=JC3FBRcBqtsh5+bShruP4Kigama0EGeph5wp7ZWZgs2nAFYITPgAr+MlQWxWFJF/rJ
         kOwvygrDBdVYc7MyJ3fCgdSPBdtr3rfL+MVR06hcAlA61ljV0Jpa1i/BlWT35pSDCp9O
         AS7SQX+9hIdTd8M5oNLoCPzURVS/pXSsgnkfSWgvVHhOuadRmUNhnIhdbX38OBqIms/m
         a5YYQy9EDqx9M6kIRhrurXxpNksB0TJg5Nyt3HbuN2ZzhSIHwKBcMvJfvJOPVnQJjnSn
         5LyNED/+QXevcV2diA1VEMkX9+b821OONhUrSRJsTHgXdVpga5bwjiZxcQZojslDJOtw
         pfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152060; x=1750756860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=782eKPHUPR9W1CknMJSaYhpUhMv8eFo5fzTvocEbp4s=;
        b=gTsdTlXR6oDb0foWS9U0aMMb0sBYSY6itKwgPN6I8kdRzmHGjdZ5aZPf8AVcUwz6Y8
         VM2DvgPgPZn+ixDYjr6amcL3UnbrnUuZmy3/Ep89F5B2ELrDv4zHkoUrblzZ/zSrJHIP
         BiOPy/gYpJ9czH+gn81x9KQqQ1bpSc9bO5O89/+hBZoGsegaa5PYf3nfbpdPl63eVeXZ
         K/Kj16JXHmBfZtPBiJFjzyRIjW3/CEfuAv8lmvowvql+TB+BAupgZ6CNWoeIRwq7xhBX
         V7sG6xWxtI5XDw9px0WZuA2VjKr4BI5HZi1GiARuerOpQVs+Gx5isxFBTS+n1im2jHuQ
         tEkQ==
X-Gm-Message-State: AOJu0YyfiG30vHCXKSZXnYyNty0AolJxGoTPB9bsTBaAzhUCBuf368bm
	fzTD6pgpjlvBcNhqRxbCiw0eKwpvo/V05Amci3dExCDnrlwIfs9Z+kSjfbgL4lLNm7AE9FsY40e
	VO8nIvcpPyC9k8wxHMw==
X-Google-Smtp-Source: AGHT+IF/A0BicUssQguil/IqJVcdfP5ACbR+oCv6BqlfUkqtzQm8XH68lq4ydUdDkEdkq/l3BfNAg04latEbPIk=
X-Received: from wmti12.prod.google.com ([2002:a05:600c:8b8c:b0:453:f28:e99f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c5:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a572e6b9ffmr7931983f8f.32.1750152060301;
 Tue, 17 Jun 2025 02:21:00 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:20:58 +0000
In-Reply-To: <20250612093408.3b7320fa@batman.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250612093408.3b7320fa@batman.local.home>
Message-ID: <aFEzehaPHP8waAV1@google.com>
Subject: Re: [PATCH] binder: Remove unused binder lock events
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="utf-8"

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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>


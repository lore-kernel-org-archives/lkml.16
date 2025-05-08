Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB50372635
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706707; cv=none; b=qPCiaEfSmIBLxi9kg6/8hmS623Cw5fu8UEzrssYfeygrXIzNsOxwiyh4YOoF9BlpLy4diZ0WOjdelGRYZIXMKWkfqP6N6Lsyoq1sgdYyDovnTokSSioG0Zh7JG12pz0wV92bwtSN0PnxdLwZ9sWREjb+oVwtTKFYmqFKoVfMcmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706707; c=relaxed/simple;
	bh=BKDed28Ark4qkoKuZoBZ867pWA04x3aLFbnz95wymUs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J87PX2UbbFPgn5joFIRowe/JstAgZ/cr72QweFRzoJ3QqkBRY8cFhH2gWPR3lIiKyq+BTRScJZVVrcWMdPLfFRWsrg0WJ9HVr8wG8xgzagvLkGGemmYXhXPpHATMXC+fjTHYMuiWIgNFog5HKKY4WZ6NKXS9wSo0YO1PzMkQiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cTTt7lAC; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cTTt7lAC"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442d472cf84so1292075e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746706704; x=1747311504; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjqECzM0xXdHzh2jZHRXI7ayViPuMFn0ZCC41M7pi0Q=;
        b=cTTt7lAC1iomH9YBNxBGUtHnA3YmQa7LsC0mzy6YSxZmQoc06cpkxGW3nf+b2iqIVp
         mp0J4n7P3199upD++xfW2lmbKWfpCN0to7u9shzddavJPOvr3gDGeucFo9FoZOmA54GL
         nBxf3rKAbIUhgF7L/QX7KIl3iSteokkPLrJ73LUiStiJBwfXr6hMtSk9SRpOwsfnAPyb
         XjgxWhQXHUq5NNRXtw6WDW+w4tZrpM5MGzBmthl/WrkUat+0EJwuMt4AW82dGbZTtpFc
         gS9f2GZsmofdsRbxWx5mM9DwnsXkjFj2Txba8W6BM6wl0qOSqxUIAoF7dd9BIAUHJjPz
         nbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746706704; x=1747311504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjqECzM0xXdHzh2jZHRXI7ayViPuMFn0ZCC41M7pi0Q=;
        b=tszK3Tckqb8MVo+EHwfCjEcYApzIW/Ps4WMRoLTs3b3/tuDuU/GP2WdZcuVLNcSLyC
         C0WTa/8ldWQqxBHznegX3/61gGKXvlwTSohizGfzhXwTgrNw+SDXUPx3oc8q7sjbtAK5
         MyCLexcZK0tnVVe1wZh01i7WS3nbE5M3u33GU6B7xkX046+kk9UyR3Sb28WvNU7ssa1l
         l5YoL8wrnbozcV6N/HzC9bNlnTyUeJ2R7G5O3cps2SNPWqnbtBdjEnweTRXOdbY8j7Sl
         8peM9Gik2mB4TNKYBFaKL5Pz1fL/ujbMvQopnwbk04RGiQmlLmrRTEJWnlUc3bbwcNvb
         XnEw==
X-Forwarded-Encrypted: i=1; AJvYcCXXCtX49dz6TBMBHOgF3eZSAv08VpLxZGmAmKvvanAuBf4jh9CkJtPCv9YBwbcxG5BRh68xRIiGZ5uFB6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP4QoVExrEFQhlU4fsxbwVC15c44HAH4sjY6E53zaE6VnrNrXh
	jitTffP7WQ++r+8B4FPHR9AmYTsuDnTR28OdkQ2BHJo8mt/rfpWxX596w98SYgyVHGD9Mry0aVq
	4ft1sz48Wdknf3Q==
X-Google-Smtp-Source: AGHT+IEU6+k6ZMms5Qt9GQmX7fD+aX8PtD8q8I2nIMeqHz3kCS2UbIip5rEgZJznrONbm8k5k357hzP8cJok5fM=
X-Received: from wma13.prod.google.com ([2002:a05:600c:890d:b0:442:c98d:df37])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3545:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-442d0225970mr32348305e9.0.1746706704107;
 Thu, 08 May 2025 05:18:24 -0700 (PDT)
Date: Thu, 8 May 2025 12:18:21 +0000
In-Reply-To: <20250505214306.3843294-3-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505214306.3843294-3-ynaffit@google.com>
Message-ID: <aByhDepxNsCCr3rI@google.com>
Subject: Re: [PATCH v2 1/2] binder: Refactor binder_node print synchronization
From: Alice Ryhl <aliceryhl@google.com>
To: Tiffany Yang <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="utf-8"

On Mon, May 05, 2025 at 09:42:32PM +0000, Tiffany Yang wrote:
> +	if (node->proc)
> +		binder_inner_proc_unlock(node->proc);
> +	else
> +		spin_unlock(&binder_dead_nodes_lock);

I don't buy this logic. Imagine the following scenario:

1. print_binder_proc is called, and we loop over proc->nodes.
2. We call binder_inner_proc_unlock(node->proc).
3. On another thread, binder_deferred_release() is called.
4. The node is removed from proc->nodes and node->proc is set to NULL.
5. Back in print_next_binder_node_ilocked(), we now call
   spin_lock(&binder_dead_nodes_lock) and return.
6. In print_binder_proc(), we think that we hold the proc lock, but
   actually we hold the dead nodes lock instead. BOOM.

What happens with the current code is that print_binder_proc() takes the
proc lock again after the node was removed from proc->nodes, and then it
exits the loop because rb_next(n) returns NULL when called on a node not
in any rb-tree.

Alice

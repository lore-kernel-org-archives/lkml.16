Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7427B4E2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676863; cv=none; b=mcHIGoNDHre07WKdo5zjEr2ermTrC8rzt+pZcody/IzbqSZVV56AVyOf+yAqwcgSygS2UFHwJQkQYRivcTKdCJs3UT8h/K9BCNh5wF6gwkwj2zB8YQO6mg1JpS5aURiyakO2bJXskX59pdP06MoRizRv0jKqvch5W5jJ+nSW0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676863; c=relaxed/simple;
	bh=F5sKVVPf805vPG1h8MP+c+v6PId2H9z7S1X1vHxDNek=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EAbmop18tri8oBdSIOygQZfYthkAVsGnEwvvaDRoAoOHksR/hzcBBfFBSaod3igXCfUVFNhh2zPErlPXdq8sI2IDPnFMXZLvVA+QNx+FWMOKAi0+zaiSKbLlGldWQEyDu9kFWjmRTWxUi6F+JhJAroOf3WQxpRJpo99B4yENpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3sVqKGG; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3sVqKGG"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43efa869b19so38971795e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747676860; x=1748281660; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FsdeYCtxu4QlNt9hw6uRt+jrBcOwzhlnzzNIjRdX8dk=;
        b=T3sVqKGGlo615Ehv6E29t8k6wnJDv3JBdAWpnmLD2szQBimjyRIJEicgcbNrZORC4u
         CPFeG6Jgd44DnTyJovfJotg4+k/1cKHUopSN1QL67P5eZRuzFUgWKeTfJm5Xq8y1tVMZ
         fgHrd9RYDjMZEhfmjArmgVnEMk5DBxumiTfbmChv7F/R6ZlxHxIBUz0YeRAzI3+MTOvD
         3s/LMaLVs62vUWnc7QA8SSzWeg0o0PH0nwH3xGHddWoKeAvzq+IuRAKTPSy7Lz5vaa+d
         4YvRisOBWFlYffvzDRHUqvN5ekyQZSEG5wDd5lp7vQjdM/oeQbwlauk0mmzEFlX7KYZw
         pgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676860; x=1748281660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsdeYCtxu4QlNt9hw6uRt+jrBcOwzhlnzzNIjRdX8dk=;
        b=J3B9Bbsnwoa8jhzGtNObuNbrpKPjsWO4GXvGd/D7biVxLrcHj/6cL/1bZmzeiv52ay
         J3jhANBiqb4WOyL+F1t6gBGS1J6qIwaLo0prYOh62wrY11DrrE1lEa8V+UZrl/+7ZuVW
         HJTGZ+ly276J6wxlPAR2R9g2UlV4/yUjVqxIQNMDI8cGWuiftls6b80B1zSpVreFyPC9
         SmMZP4VlylmiGDnQfL1YSLGafCXCMXNtThdxhgwzlGsKP7tTW+YLvGI3P7nlA/ZaUFji
         DEBCDTdGN4X7A2vkSyekMARmyZMI8YvMY6tFNJrVfzb5G1pn6aD3QRjhPLj4HEmUSJ8L
         /RxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/DFRVtUygvsO9F/wAB367X82kLsisr6Qer7GMprCrzTmrS6mJ35w0eHaW4ewWCcjTVtCVT289hWGszmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk1QYB8XJAobC6EriY02kIkeJvtRQR/20aUk9qPj2irfRbP/M2
	Fn3rVvkH3v0c0YHsswgpswcPQ1+w7vLXdTI7VYn9G6qaatBnc6ISASstPc9Ltnr7thDzuX5K6im
	+A3JoNVPkIBgA53enlA==
X-Google-Smtp-Source: AGHT+IHcvOL30EQuS12/edxXekue4tBWyq5H5qZHWBA9INPaTzQwddva/SGP2qv4KXQO3B2y9XGDSxiTy6oJyQc=
X-Received: from wmbep11.prod.google.com ([2002:a05:600c:840b:b0:43c:ef7b:ffac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d8c:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-445917d2a0amr48733045e9.24.1747676860523;
 Mon, 19 May 2025 10:47:40 -0700 (PDT)
Date: Mon, 19 May 2025 17:47:38 +0000
In-Reply-To: <20250510013435.1520671-5-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250510013435.1520671-5-ynaffit@google.com>
Message-ID: <aCtuuscwSM4vlH01@google.com>
Subject: Re: [PATCH v4 1/2] binder: Refactor binder_node print synchronization
From: Alice Ryhl <aliceryhl@google.com>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="utf-8"

On Sat, May 10, 2025 at 01:34:38AM +0000, Tiffany Y. Yang wrote:
> The binder driver outputs information about each dead binder node by
> iterating over the dead nodes list, and it prints the state of each live
> node in the system by traversing each binder_proc's proc->nodes tree.
> Both cases require similar logic to maintain the global lock ordering
> while accessing each node.
> 
> Create a helper function to synchronize around printing binder nodes in
> a list. Opportunistically make minor cosmetic changes to binder print
> functions.
> 
> Acked-by: Carlos Llamas <cmllamas@google.com>
> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

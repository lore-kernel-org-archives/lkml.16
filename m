Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F74226556
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707249; cv=none; b=bakZOV2+CryLHKRM8HMAzDuifnf9jYuTKNS6F/5Zyft5ZMMK82Xu58PcrgJrOPy84N/BswGDJ1zidq5GbdMAY30jHsCz/vqsN+AYxQIPROMW9xBDHtYjYVZPqIRHQYzNlSkfnWo8GZfRZwQ2+Fq1D6aL/pgO8MjX7nSdr3/0TMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707249; c=relaxed/simple;
	bh=knhgmqjC+LYrN4LfTA//Bbu1wdLXVvLef9E7e4pGDGA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K4f3NDu8J+WI8CWB8Zl9q5K8QogLb62kxU4Oozi7YFOgobO1lsBR8U1ihM5qjJt9TTChWqNXKehSaWH1PVR+J+FRwim5f23qmFsk7NOMgoq8w8jyqUqYIb36zXLlkmc9MGr+wJOLzrRDGvHJ8FEdORvUxqA0UJqTYmlq0YyXlqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r3ZFm1s+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r3ZFm1s+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so4357615e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746707246; x=1747312046; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zlt7vDOYRuKS+k9u/oUe5/3RWmsRW5OmWW9Gjm/Olvg=;
        b=r3ZFm1s+/7YFZqB36+XdvQDuPisaFMeUKh6w2yC7FGRADcUV6U16JdDfMW5ndjaORX
         JntsYWjQET1x9nEAnwzqUEYJc4+PgcCNKoZqOWwh1yL1dnWB07kx9tK0cdvG/Rx4Wt3Q
         KmDO1DUdjUgdeiM4O1GtmTWdowSAbcQvRlNPde+d192v8wv3lmpLmVZDFhyykZ9+YLYN
         2rnbcqEtXmgLftMel0PWL8eVwtbn0rbXyZdK98EjcPiOuI78jkU0nCHihh8LZyKDU9Yp
         vSOf8FbKlqR34WykqbTqp88F2yVf3Wp9hC4gaB9UVYjtnCBPQZXUZMWQ6sQ+/2Wz+kzN
         rPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707246; x=1747312046;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zlt7vDOYRuKS+k9u/oUe5/3RWmsRW5OmWW9Gjm/Olvg=;
        b=LJSn8j5SOuWJy//dR9ZMJB3YN7simcz8OETrgIuSupxfDIFEvPRwcz0fEonvgvTJXT
         F0WACh1RWg7aHutTxdMmoQltnmvIyuBw4vTOCxXjdoNAF1a5AFDhqxLb17o8U/PxxPI9
         hcGVtBW+po39TNVLnRgbiytunW9r81Zy2ZEv3INZ+LwKTLLATS4eXMBLa8muTCsTDAjv
         vDd1zh7WxKumgwJSp39k6TDnw1eEwyhQIpC+nHhI9GECX/Zyh8CEqhS85wA6Rt2tPeyo
         PgaUXMBUt2/ZLcjx1ELveWURzqIOXuDpRlzjw1BA942K5qWlVBNzxCZm2gtpXMfSB5lt
         E0EA==
X-Forwarded-Encrypted: i=1; AJvYcCXcb+dPUqAQCCbsSowrqAkdHcwC5sHTskK0Bf/bde/IhnuQV70nX0sB0OUE5tJUJVixA2YI662KppQDjk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEYj1tjjV2EAefZ03QU0Mo1hln7lF0L66eWdmhp3EE7TJLRpSf
	3GA1JMslLap3ngZ3goAj765t5rz7oTdXiDsbClscbqb3drUKNevgZyMtXmY2X1NwYpy4Ur1/OLo
	LNwfRVoUW7Skc1A==
X-Google-Smtp-Source: AGHT+IFyPbf4TPezjTv7hjBojk1WoHQtD4cj1iM4uzg2wrEd2KfR4SSFofLNFplgX27HCXH8tEuxn7dXkdL9TuY=
X-Received: from wmbem10.prod.google.com ([2002:a05:600c:820a:b0:43c:f8ae:4d6c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0d2:10b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-441d4e87833mr45345855e9.30.1746707245987;
 Thu, 08 May 2025 05:27:25 -0700 (PDT)
Date: Thu, 8 May 2025 12:27:23 +0000
In-Reply-To: <20250507211005.449435-3-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507211005.449435-3-ynaffit@google.com>
Message-ID: <aByjK9-FR6KsYx_7@google.com>
Subject: Re: [PATCH v3 1/2] binder: Refactor binder_node print synchronization
From: Alice Ryhl <aliceryhl@google.com>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="utf-8"

On Wed, May 07, 2025 at 09:10:05PM +0000, Tiffany Y. Yang wrote:
> +/**
> + * print_next_binder_node_ilocked() - Print binder_node from a locked list
> + * @m:          struct seq_file for output via seq_printf()
> + * @node:       struct binder_node to print fields of
> + * @prev_node:	struct binder_node we hold a temporary reference to (if any)
> + *
> + * Helper function to handle synchronization around printing a struct
> + * binder_node while iterating through @node->proc->nodes or the dead nodes
> + * list. Caller must hold either @node->proc->inner_lock (for live nodes) or
> + * binder_dead_nodes_lock. This lock will be released during the body of this
> + * function, but it will be reacquired before returning to the caller.
> + *
> + * Return:	pointer to the struct binder_node we hold a tmpref on
> + */
> +static struct binder_node *
> +print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
> +			       struct binder_node *prev_node)
> +{
> +	/*
> +	 * Take a temporary reference on the node so that isn't removed from
> +	 * its proc's tree or the dead nodes list while we print it.
> +	 */
> +	binder_inc_node_tmpref_ilocked(node);
> +	/*
> +	 * Live nodes need to drop the inner proc lock and dead nodes need to
> +	 * drop the binder_dead_nodes_lock before trying to take the node lock.
> +	 */
> +	if (node->proc)
> +		binder_inner_proc_unlock(node->proc);
> +	else
> +		spin_unlock(&binder_dead_nodes_lock);
> +	if (prev_node)
> +		binder_put_node(prev_node);

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

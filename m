Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B9C13B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743476621; cv=none; b=kTbfE6HHd+yTINSElAfR5up0i83jK8w2z8lRDPQ6I99iH0jy0Kw022qCiPneehMqKLjxGhd3TnphpHPzQ8vfDgy2ZczsZeoa6QPuw3wRbZ6ZvfqplijAZyA7a0yddSWHZtOgAAC2dGVVAZuwW9O1tc5sMkroowcBG40c6+sdwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743476621; c=relaxed/simple;
	bh=r6FKJG2M+mUCoEGL99LjKOla4PjjienLCWA1NscCvWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mliVYwiX7o+uvf3gBoGv37rnwns2GUp/DnuAbAUX5wkz7cosVRy67+8vlsFVtPCpnjwKTphXmZlkJu/NipFHGma6QNoxnFpEpoXa09sT0AK9B9YNgORoK4DGnZZCeIYmecY+NmDjOkdV83NoSCqJnEF70Xw+Egs7IEvWLkQd4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZVcpSKTh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZVcpSKTh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2264c9d0295so96945ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743476619; x=1744081419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BjUDQYLmLdJCHkWtR5Ib967c0f12WTa/m9uAIMxzWgg=;
        b=ZVcpSKTh7YcGrTfkqXjkS8hZGjHuJ8orpMlaIefnNrxEdZhoY12iLXO9VIL02l5Nme
         Y8F0heJ6OkvQDAdTx6lwQqw3LdCkuxknRUm9fDMibA7FmWUE8UvII5Bw6toE2MlDTZze
         HzU44MzYTFSe/qRZ9qC3u7lYMHOh4o+fOsIYHJ2QA9MRqCAeVdJbMljqPyodFjVgJWrL
         SgYBrcJaPKZSZHnF99TsCjGu0hsIml5znbxmuwea3+LZuAdsgLBPGDJ5aVy4GOhje4Kp
         zjiyIz4bDJ7q8tA27iZsMC63TJyxoMIFto6MOCvlQjl0R1z1k0dTo0r9SVr1XTEbOWhh
         34Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743476619; x=1744081419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjUDQYLmLdJCHkWtR5Ib967c0f12WTa/m9uAIMxzWgg=;
        b=Uz8TgMjIAC2mi2809icyisl9aVjuN5anueRgP98njhOZttTSmodCBuwjglZmSBJOfp
         8QxllV6l7L+CeitaKiZEF3Glyn3BdtoWrg8rxKl4hl59j1rqDv7eAeZcD9AuS9zVRx6y
         EZoMhEPdvn2+SV5mrsl0NC7dIv9WjqKMuELWD39dw40pUEOfAISQ4ndGaiZskvCYL6Y5
         vOW3TXMc1OFhAMSUvBH9GUkNfcLb1jbm92QErJsARwa9Lk1y+sv/ct7BCucDnG8dn+QN
         r7LCLikJytuVKiL5hBfNKt28CfNpXCVayYlZEW9dM/KcKocUxx2VmtkVQxsoKPSVt1Kq
         rxRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAXOAHz0T9Nm8Y7NyLE2zpbvRY5/7nhoscOY8VeLSLV8X6LgXnF2KwBZj5puT00Mp/M4eO9ClWjjoXWdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YycnWD5iSos6/1OeDh9y+vrmsvUIrxMgfOxAMI7EshpEDDtp2O9
	Phv/LHaxP5IoTMtwElp8Xsyl8kFUl+V9qY5AsL2VQKTW6lGmn5x85P+9WYHutA==
X-Gm-Gg: ASbGnct7cBz1Oi6T0qXEsAU9JfiLs4Wt4Ep969wYWnc52JDRt7MEE73NpOZdI1T7qEE
	vV1MX2Lc+HOOvXjpMTuD0x8F0/JKnUG1E+abA0TK3MyjOphiG+plx9KqBm44ecG8V1GM6+Ufl14
	cHbs+cqDy+0CafzeW1rgZD7CJmFI60JlobHSZ2CvMdbvkos/nq8amjgLcUrzHKtWaVr80w3tush
	pnlzt9wKmNEehTr9SMGF9uGmRB4GULa19I4SNCAWSEihoCJsB0jdtz6vicVJbZpXQRtuOIE5eL6
	wspklyr9fP017osITHhtW0JV/H5N2fnR7Ui9PAWjtS4tcTvVsIdMFPFLCe9Qs5bBhQb2v4jHVt1
	wSqdS
X-Google-Smtp-Source: AGHT+IE/MuK86WseXBdrNNikU3DFYrWcjoRpEbwx6nOX84qWfVtsVGInFBF1tTl/HgZkyg8t66laNQ==
X-Received: by 2002:a17:902:ecc5:b0:215:42a3:e844 with SMTP id d9443c01a7336-2295d0f168cmr953055ad.17.1743476618866;
        Mon, 31 Mar 2025 20:03:38 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305175cae63sm8135392a91.44.2025.03.31.20.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 20:03:38 -0700 (PDT)
Date: Tue, 1 Apr 2025 03:03:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Frode Isaksen <fisaksen@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Frode Isaksen <frode@meta.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: do not crash on bad transaction in
 binder_thread_release()
Message-ID: <Z-tXhrdTtV5t_P5p@google.com>
References: <20250331152515.113421-1-fisaksen@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331152515.113421-1-fisaksen@baylibre.com>

On Mon, Mar 31, 2025 at 05:24:14PM +0200, Frode Isaksen wrote:
> From: Frode Isaksen <frode@meta.com>
> 
> Instead of calling BUG(), set the binder_thread to NULL,
Yeap, not crashing the kernel is a good idea.

> as is done in other parts of the code.
> Log if it is a bad transaction (other than in or out).
> The BUG in binder_thread_release() was preceded by
> these warning logs:
> binder: 1198:1217 got reply transaction with bad transaction stack,
>  transaction 49693 has target 1198:0

So tid 1217 is sending a reply to an incoming sync transaction. However,
its transaction_stack shows that t->to_thread is NULL. I have no idea
how can this be possible. When the transaction was picked up by 1217,
its info was recorded in its transaction_stack as such:

	if (cmd != BR_REPLY && !(t->flags & TF_ONE_WAY)) {
		binder_inner_proc_lock(thread->proc);
		t->to_parent = thread->transaction_stack;
		t->to_thread = thread;            <----- HERE
		thread->transaction_stack = t;
		binder_inner_proc_unlock(thread->proc);
	}

I don't understand how 't->to_thread' later becomes NULL, maybe memory
corruption?

> binder: 1198:1217 transaction failed 29201/-71, size 4-0 line 3065
> ...
> binder: release 954:1333 transaction 49693 out, still active
> ...
> binder: release 1198:1217 transaction 49693 out, still active
> kernel BUG at drivers/android/binder.c:5070!
> 
> Signed-off-by: Frode Isaksen <frode@meta.com>
> ---
> This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.

Do you have a way to reproduce this? It sounds like there is something
else going wrong before and we probably want to fix that.

> 
>  drivers/android/binder.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 76052006bd87..c21d7806e42b 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -5302,7 +5302,8 @@ static int binder_thread_release(struct binder_proc *proc,
>  			     "release %d:%d transaction %d %s, still active\n",
>  			      proc->pid, thread->pid,
>  			     t->debug_id,
> -			     (t->to_thread == thread) ? "in" : "out");
> +			     (t->to_thread == thread) ? "in" :
> +			     (t->from == thread) ? "out" : "bad");
>  
>  		if (t->to_thread == thread) {
>  			thread->proc->outstanding_txns--;
> @@ -5317,7 +5318,7 @@ static int binder_thread_release(struct binder_proc *proc,
>  			t->from = NULL;
>  			t = t->from_parent;
>  		} else
> -			BUG();
> +			t = NULL;

Dropping BUG() is nice but this could use en error message.

>  		spin_unlock(&last_t->lock);
>  		if (t)
>  			spin_lock(&t->lock);
> -- 
> 2.49.0
> 

Regards,
--
Carlos Llamas

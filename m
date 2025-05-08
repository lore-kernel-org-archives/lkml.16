Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE71E1E1D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730902; cv=none; b=JYDHwKCL5caEc3dbk84K8YcK8NOtQYk4uULGCnB4+tberVi1BW/7JNBIZCvlY4xiJGayaAGWcODfAfEyg2O0MC62b5aK2tSkbS0SVymff/TCcsYTByAZfY8rG2la5kgnlEHXrgrqbAL8hNH+k+wLn7EDfShG0TJE6GTfGkcgBmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730902; c=relaxed/simple;
	bh=OhtRTwDE1qL9AxFLxvqWKGiPJgX4ztyX2V7bG+TGkkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=riw5nGNcVAJM60EfE4gKwvw3wRrVL0ALD4p1UBGgm7nFR/QzPlHJTNhc5J/bimTZim6ASSf1F5xZm0gPpinDrsAdY1+XmkkbKa7SGK9vp6wJwQ6FFW6a2ABolQr2qNgVEkdKMuiGyd7qBbAYDgTZT+f2wVHwETyg8AhZAMa39cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bONcfhqz; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bONcfhqz"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b200178c011so802303a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746730900; x=1747335700; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1DcmJX4ML7lGnJRc8FKDcRqwKW93OBjv4r/7eBWYDfc=;
        b=bONcfhqzqvIirKArqwZneW3ew69Q+RMARhM9S94YVFEqVAKD/xu1x0me0E88Vm6vj4
         tYxE94XBdMUT4iBNeFgClKodMQQSV9o/QIpCXQ2/qIFeudCzIC1Imtp0u076t3caIayp
         s/WMHmChQm5dKCq6DnwesMInJaCwfZ8+bQ54yDf1Q2u1U3/z9gW0dbLZZdujvmR2932i
         hdIub9h7cHT6HmX0L9KImaFlvi+igOP/5RWiH2BmN4oBuPenO6oaq+zuDdIthe0bWlUb
         SNGiRZKREIIktuzm4sro/B794/iFMuu7RxqtGVW2zUrVvuuyBD/fow3xGpKpNNfdRVnR
         fGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746730900; x=1747335700;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DcmJX4ML7lGnJRc8FKDcRqwKW93OBjv4r/7eBWYDfc=;
        b=n0v/tzvqpJK0ADlei5wgWLqnU3MngmW7OVJ3ko6fMjM88B99dEeqVReKbBnjKq9mgl
         UOgtT0nNuDLvd8DMcPaXAJ1hD2w7D8cnZ2LcgUJ+pQhcTrYpjZwx861FAZIAvRKl4kJQ
         PoZjuRmiG9EyulGpYGwOOecXKzIf7io6tVAgYjcnGJDJc5yrjYao/ffPsyXIs9RVBrtF
         /BFHNpSA0yG0az3eLeoPEhGwi5K+MRZrpuQyN8xC0TSaXF4KEf3fUA59TbsbSTNcO/Ja
         FESwdwcHayugRFne85QvZVmcNH/M/M812FFKg7tumWtv2nuIGaF1ixOZz+2nQ95Aj1Do
         AR+g==
X-Forwarded-Encrypted: i=1; AJvYcCVZfj7yE48BuKU+0Y36uSldeiaZGBqCpvJbdp9oIbvR40nhYcyyS4yORrPqoUHtTrCXUUxHjEvmI0OxwI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ngj5xPuZgRLg6Z25FTQvJGCg0LyhqCsZ0Ogy3U0pUtuf7SQQ
	V6EtVgutdUTdIDIsIsrI4W5k/4DgHsY9E4k4aXQTuanawl9lf4DKnk5OwYv4NQ==
X-Gm-Gg: ASbGncscqj1urpycjMBXCVkivfAoBXgExxa3Gff+ky3Gk46mGUb+ChAnvAJOIdi+6Iz
	0dBrt/EIHeNfA/P2uwP5bxCfI+WaxFlLjHhzM8C5Q7QkZT0gepdn2pbOl5x2H83TT9aAlkLVnYh
	sVTtvuHhy1w6WmEINDcTLu5Uz273oQ03hTHeYceBMVv6eC0J/jNPE0obc4fQk1enMF17caXfO/g
	KCk9G3ZMyVjgnAioNdDu/H1/SxlcvIMgUlwikFKxq1x7iuMfV1drRTwSf9WTfTrGiRx5+ARyd08
	C6mkNF5BwieGi/0noT9OzZsJzFcEB9pWGXtMQjRw4DviElVpZIUN8vvs8tAhUmyABnWy/7BBg3F
	Xv6k9DOMkYr9qs843wb53j9RfLHCrSjRBzM/cX0xI
X-Google-Smtp-Source: AGHT+IFXh0UbKphroz4qlCPM+lyZJHlSqYTbTxv1tVmdsVPbp5su+LaY8uPwkBUxIeXhuCENzclhEg==
X-Received: by 2002:a17:902:e54f:b0:22e:62f0:885f with SMTP id d9443c01a7336-22fc8e99f2amr7088435ad.40.1746730899962;
        Thu, 08 May 2025 12:01:39 -0700 (PDT)
Received: from ynaffit-andsys.c.googlers.com (214.218.125.34.bc.googleusercontent.com. [34.125.218.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c17sm2837465ad.121.2025.05.08.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:01:39 -0700 (PDT)
From: Tiffany Yang <ynaffit@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  =?utf-8?Q?Arve_Hj?=
 =?utf-8?Q?=C3=B8nnev=C3=A5g?=
 <arve@android.com>,  Todd Kjos <tkjos@android.com>,  Martijn Coenen
 <maco@android.com>,  Joel Fernandes <joel@joelfernandes.org>,  Christian
 Brauner <brauner@kernel.org>,  Carlos Llamas <cmllamas@google.com>,  Suren
 Baghdasaryan <surenb@google.com>,  linux-kernel@vger.kernel.org,
  kernel-team@android.com
Subject: Re: [PATCH v3 1/2] binder: Refactor binder_node print synchronization
In-Reply-To: <aByjK9-FR6KsYx_7@google.com> (Alice Ryhl's message of "Thu, 8
	May 2025 12:27:23 +0000")
References: <20250507211005.449435-3-ynaffit@google.com>
	<aByjK9-FR6KsYx_7@google.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 08 May 2025 19:01:38 +0000
Message-ID: <dbx8a57nrkod.fsf@ynaffit-andsys.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> On Wed, May 07, 2025 at 09:10:05PM +0000, Tiffany Y. Yang wrote:
>> +/**
>> + * print_next_binder_node_ilocked() - Print binder_node from a locked list
>> + * @m:          struct seq_file for output via seq_printf()
>> + * @node:       struct binder_node to print fields of
>> + * @prev_node:	struct binder_node we hold a temporary reference to (if any)
>> + *
>> + * Helper function to handle synchronization around printing a struct
>> + * binder_node while iterating through @node->proc->nodes or the dead nodes
>> + * list. Caller must hold either @node->proc->inner_lock (for live nodes) or
>> + * binder_dead_nodes_lock. This lock will be released during the body of this
>> + * function, but it will be reacquired before returning to the caller.
>> + *
>> + * Return:	pointer to the struct binder_node we hold a tmpref on
>> + */
>> +static struct binder_node *
>> +print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
>> +			       struct binder_node *prev_node)
>> +{
>> +	/*
>> +	 * Take a temporary reference on the node so that isn't removed from
>> +	 * its proc's tree or the dead nodes list while we print it.
>> +	 */
>> +	binder_inc_node_tmpref_ilocked(node);
>> +	/*
>> +	 * Live nodes need to drop the inner proc lock and dead nodes need to
>> +	 * drop the binder_dead_nodes_lock before trying to take the node lock.
>> +	 */
>> +	if (node->proc)
>> +		binder_inner_proc_unlock(node->proc);
>> +	else
>> +		spin_unlock(&binder_dead_nodes_lock);
>> +	if (prev_node)
>> +		binder_put_node(prev_node);
>
> I don't buy this logic. Imagine the following scenario:
>
> 1. print_binder_proc is called, and we loop over proc->nodes.
> 2. We call binder_inner_proc_unlock(node->proc).
> 3. On another thread, binder_deferred_release() is called.
> 4. The node is removed from proc->nodes and node->proc is set to NULL.
> 5. Back in print_next_binder_node_ilocked(), we now call
>    spin_lock(&binder_dead_nodes_lock) and return.
> 6. In print_binder_proc(), we think that we hold the proc lock, but
>    actually we hold the dead nodes lock instead. BOOM.
>
> What happens with the current code is that print_binder_proc() takes the
> proc lock again after the node was removed from proc->nodes, and then it
> exits the loop because rb_next(n) returns NULL when called on a node not
> in any rb-tree.
>
> Alice


Thanks for catching this!! I think this race could be solved by passing
"proc" in as a parameter (NULL if iterating over the dead_nodes_list),
and locking/unlocking based on that instead of node->proc. WDYT?

-- 
Tiffany Y. Yang

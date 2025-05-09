Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9762750FC
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781043; cv=none; b=atioxLwq0B5XgdApnKoYzofvUHnhSQvqVh41/4SKV7qm4nZS/4bGonQtDO+CqWdbsbOHioqy6ns9kErx4JGMa6/f3DZdbKSY7oZFGGnJEmuvgvKHoe2sg7zu7sYhxUpbwjblC/ou/mexkZbsreLtgo8ndNEGG1O3T9thMnhqqZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781043; c=relaxed/simple;
	bh=R+9CnLehBKqfBSvZuqQpAsrEp7E3sWeVIVk/b6VyBJ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iiHXgzslIwwJzbljFNCrZNkfs2fLbKj9wflnOe8lExN+aM+LoNP1T0TsB1vd87QYTLTMKmOYX44OIbP7vok8kkkOWDQNJDjW2QYqONxEzt6UlEfoiTTSmpCcgZ7CAiLaAA+N0xFIyT48DclI1H1+/JcP32XavyP4X/qzb7nrXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=33eSrwXy; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="33eSrwXy"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a0b7c8b3e2so1250503f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746781039; x=1747385839; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iP0GIrhMfkUhRnBdT5rEtUWXHmjU+cDPxxlDMopY3Wk=;
        b=33eSrwXycG3P1pImvvO9HeZzjC5yQSZXPv4AWuiRbdjseVNHGCju9x3xZjQLSivUJc
         7kJioTcRJET1OvTCkPvsrkRKw/7rxSdVPXzW7eoP100TWmrTrPcyjStjWuUjmrq2hO37
         uHvo5DCCK1tLpkVLmBoHWQSEAQdL06ZWUS7sigmprhvKrqvpc2sF9/cJ+4+yQqLMsb0T
         5+qj9yLqE8hbF44TrxWHusIfJ+aiT7auA/2hLNjw3maagk2Peh0Kf8Rf4/aNjP6k04wi
         mgQdKvFRM4VB3dH6uETaxOvwo2r/B01NWbUUdXFTLwedd+iP81nLEo7C1JmKgOX7TVZ8
         IQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781039; x=1747385839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iP0GIrhMfkUhRnBdT5rEtUWXHmjU+cDPxxlDMopY3Wk=;
        b=ZV5NgycYTSD4rYQGNIzYnI8mX2/SmrlODT+1huTQgrI3veQGfgduTx/h1qAats1ARE
         Nxpd4Q/gcwLjcYk5ssNTdJFxPEEHLlZnJKh4tfv02R3e82cjc2RzyPZ0rVsKUJbJlntp
         dMgfoA//kHws6F3ALeeA2kMWYQp5LZRfqStrsw8U3xQMUdj1yoOqv4gxglXWdIixcIjo
         SQcbCwsS9NO+ReHxYa6j4Z4i7+WvBcImA2jQeiGOoYL24bxVJLQ3WINr4osV/83xKZ77
         5QPymMUUVhEYMJg5dH6wIxi4oPOavCGclyiz2qz9XBESi2d3/x6XvMAdYoySMq50xEUj
         4ffw==
X-Forwarded-Encrypted: i=1; AJvYcCVF50GE2+tnx7lLS+3NUi+xRbqoEyHehzcmeMm8yVgKaCVy4Nixb81Vv6HT6J4QL/STLIxbN8vWYhcKHow=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh+gs9gedd8ARBYcYrhyEhLx/+XCId6u3gqR9S2Q2FQnZ5Y+ZO
	AzSeBFCtbTg6fAS69H4xluDdY2o0qBxBS+2uQCrkeniGEbmwv9JvLGOFXDV5MyNrzxH5EwiVVnQ
	QnaqwhwTwEw/Jmw==
X-Google-Smtp-Source: AGHT+IGQ5Dez0I0n5aW+bmnJJQk6izAHF7Klp7GU4gxJF/MMP/32u29u2Wp72hGxzSMQGZvSQUri6B6q1UgUXMw=
X-Received: from wmbhj20.prod.google.com ([2002:a05:600c:5294:b0:440:68cb:bd4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e3:0:b0:3a0:847d:8326 with SMTP id ffacd0b85a97d-3a1f6445313mr1892954f8f.25.1746781039581;
 Fri, 09 May 2025 01:57:19 -0700 (PDT)
Date: Fri, 9 May 2025 08:57:17 +0000
In-Reply-To: <dbx8a57nrkod.fsf@ynaffit-andsys.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507211005.449435-3-ynaffit@google.com> <aByjK9-FR6KsYx_7@google.com>
 <dbx8a57nrkod.fsf@ynaffit-andsys.c.googlers.com>
Message-ID: <aB3DbelD08I1hL3U@google.com>
Subject: Re: [PATCH v3 1/2] binder: Refactor binder_node print synchronization
From: Alice Ryhl <aliceryhl@google.com>
To: Tiffany Yang <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="utf-8"

On Thu, May 08, 2025 at 07:01:38PM +0000, Tiffany Yang wrote:
> Alice Ryhl <aliceryhl@google.com> writes:
> > I don't buy this logic. Imagine the following scenario:
> >
> > 1. print_binder_proc is called, and we loop over proc->nodes.
> > 2. We call binder_inner_proc_unlock(node->proc).
> > 3. On another thread, binder_deferred_release() is called.
> > 4. The node is removed from proc->nodes and node->proc is set to NULL.
> > 5. Back in print_next_binder_node_ilocked(), we now call
> >    spin_lock(&binder_dead_nodes_lock) and return.
> > 6. In print_binder_proc(), we think that we hold the proc lock, but
> >    actually we hold the dead nodes lock instead. BOOM.
> >
> > What happens with the current code is that print_binder_proc() takes the
> > proc lock again after the node was removed from proc->nodes, and then it
> > exits the loop because rb_next(n) returns NULL when called on a node not
> > in any rb-tree.
> >
> > Alice
> 
> 
> Thanks for catching this!! I think this race could be solved by passing
> "proc" in as a parameter (NULL if iterating over the dead_nodes_list),
> and locking/unlocking based on that instead of node->proc. WDYT?

I believe that would work.

Alice

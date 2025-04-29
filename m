Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931FF2472BD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951432; cv=none; b=pu21PWl2BahveTf506r1YeiYyO/gPg2jEGYI4It/BsHNbtw3QXgvU9y7tJ8H8JyGkOQUMAMZisl58/tzJ6ypXRuC7TAXYHbyObRlWf+fw36uJTIpgDe78VPeOT9cKiqFiJ//mkh7ZroXXr7WTAnOpImf5WaHmTBthcC50eC4mt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951432; c=relaxed/simple;
	bh=AYT82nc38WJwSZy5HgjOKkPb8vsqJvvjJxxGUEXWt1g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYXz6xInOATW/xsuau2cmu8ybT+glWaIDhK/fyWGiLaCEL7L8uSPxjp08+L0EHmKE83XBeSvCjPv6BI0U6SQsPkeZdHGhvw9MF/y73rhYnW/ZXK5XwBCCnbsiDUPI2z026im+/RNcnsB+cHnhVjQSy4zCIJm1IARWosVWKGia1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeUlX375; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeUlX375"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-702628e34f2so1746287b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745951429; x=1746556229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2/kKLn23gVJ5MvctnTFMLPP246vCSgXvuh10TQHsJ0=;
        b=EeUlX375O7VFdWsdVh9CIY2uiWz2rQ0MKQFN8Q4Wmiyg7V3A+Xl/9r6ArffN2DATOl
         vVjhtGzB5SM9X9e8z5S39ZYP5Gnvn5kfuvA4KkP1VzoRWZvZDKjzqDEznd8nfchTwVO6
         FFf0sBn72pE7pieWpfS3V0XV9HSxNtiNPHx6VQM6jFUyZuxsGuz+xYBhdBNDktoOvDVf
         9rt1CbOq0qTNy17m10/319iiFoq8meQUwn1u9I5EePyJ3eieScH4n/jj1GvBssJ3XY/f
         1Kxs1sclAsCmquIouj+lsbPI84C+S6LKvZw0bJnIQby8fOTB48orEFIz7LqopKtnbXrM
         gTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951429; x=1746556229;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2/kKLn23gVJ5MvctnTFMLPP246vCSgXvuh10TQHsJ0=;
        b=s4r+lXfc2jvWudOb6hyvjgFcjt83vdGXccmo1BG1oVmN0ziYAlVz0xMoTEWXfQlOBM
         s0HOdnCsd7q57iMUkeRzqvlhn2J9u3dC56WGSAfbjQOP3WsM1o6EQ+dlx5aZh1m1R/Wp
         44YKZjaPsJlGBVMwlwzHfBGQE0e2Ny7SejgNJob/XftVVsGChdhtoyuQjNEY8av7zDrh
         LU5YWE9/+dD6I/Vz3d8hkE66buq9rRDO5lT/K1UfvF8XqNx8cI8XWgpkFSr9n4fmliz9
         +d633wjvE4K9SgyfOQypbYGV2qRsgIiF3SEks83qJcVEtgTHM04F6yB29m4kSVNeVDit
         ys8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlp2sCGQLSHosM/NQqaMNQ7XTOhiqYfYeHx6qCchWPqViVH3dr3jLq2xZEzIdJj2jFpOp7xJNxbeQtxrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbr4ACSLA03P4LnZT7wHWVIhdIFS9H6lEWOdXpz8ENV0Mq973v
	09dM4rW/sO5uEUPprHF6/0UV/Aey6JlJnHWeh9Arw6G6R94E/D5s
X-Gm-Gg: ASbGncuyTrW6vvUjGugZiuv1yFu1qEzLGxhViqurslnsn/46wk5shaTeKtSXbHDgukT
	/K5uG9O94hjSYBwg45ykge3w2SZkYlXnoT9Rg5HKWIsdbP1Xi9SnXDFf4Pmq5eFJSBRFZ9W1aFP
	bU75iWypKgb9KgbE9b8dupM0UrylKvrYgXOsY7w8vRMJ0hvxbTJw+E4kRWj9xZE1+wrzsXmLe/u
	yYK7J0APqESFuBphIHFOF2AOVOKcH6jm+2MC9IIQbohe7sN44q2ueOuFG5V4vvTxm0qUavFFjOr
	J+YYP/ZEr/A/2gd/elj6BqAAUunl+hKL+2s5hgTGlqPoWHbPICsnXVThMTUcNL3mssY/HSeFnwx
	T8PZxx6QumvGkAJzYddaCK9/qP3Hs3V+o/mt3w0DwLQ==
X-Google-Smtp-Source: AGHT+IFaJ8PJLO6+gJFc3Bq1DkocxxcpnuO2vcOmEdQfPjKWOWe+TdUMOhANbLVWvtNXBJ4co2QGAw==
X-Received: by 2002:a05:690c:6a81:b0:708:31ae:5ef8 with SMTP id 00721157ae682-708ac0d995dmr5311157b3.1.1745951429554;
        Tue, 29 Apr 2025 11:30:29 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70841933581sm31881687b3.8.2025.04.29.11.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:30:29 -0700 (PDT)
Message-ID: <68111ac5.810a0220.2b20a.1d32@mx.google.com>
X-Google-Original-Message-ID: <aBEawsCN69SjNSrM@winterfell.>
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8B056120006A;
	Tue, 29 Apr 2025 14:30:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 29 Apr 2025 14:30:28 -0400
X-ME-Sender: <xms:xBoRaOp6rK908_Fmt4UrYLQLbcnW00zRvj0KJxElo10gv9GP_vKhkg>
    <xme:xBoRaMqtjEYHnp1WVkqd0zzcP11mcRbejowOQKqk4edkiIIOW8pJdmNH2jG0yCzpp
    IXzOntsl3qCohZQjg>
X-ME-Received: <xmr:xBoRaDPTocd11il3JxZ__gRBZZUZqeCsUDxMaeNFyqyN0zFx_eZnT2NmTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedv
    teehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehsrghshhgrlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhn
    ghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgv
    rdhnrghmvg
X-ME-Proxy: <xmx:xBoRaN4qjpUepFsx8oTZnDcT09Kn7-tm40EGxw51rxIr4ivT0AzglQ>
    <xmx:xBoRaN5496xS6tV1tU9aiWvFOTNLhZASHxG6CAQmiYM2-1xLlO6Llw>
    <xmx:xBoRaNiGhG10HPYpu1zieSgkggCYZZFHuwUesJ8obsARhhTOflY2og>
    <xmx:xBoRaH4LUcRWomWEK1DxNdFRqT3Kyu7YMJCNQCdxWCfxhaIZQVvUgA>
    <xmx:xBoRaILlrUv_TNlJbtDv7RrnH7JVoiy-ZDZOunhYRq3Nd5Clc4Cl3K9c>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Apr 2025 14:30:27 -0400 (EDT)
Date: Tue, 29 Apr 2025 11:30:26 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	longman@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] locking/lockdep: Use hashtable.h for lock_keys_hash
References: <20250320143120.3119975-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320143120.3119975-1-sashal@kernel.org>

Hi Sasha,

Thanks for the patches. I want to let you know that we are currently
doing some changes on the hashlist usage in lockdep:

	https://lore.kernel.org/lkml/20250414060055.341516-1-boqun.feng@gmail.com/	

so, it may take a while for me to back looking into this (until that get
sorted).

Regards,
Boqun

On Thu, Mar 20, 2025 at 10:31:17AM -0400, Sasha Levin wrote:
> Convert the lock_keys_hash array in lockdep.c to use the generic
> hashtable implementation from hashtable.h instead of the manual
> hlist_head array implementation.
> 
> This simplifies the code and makes it more maintainable by using the
> standard hashtable API defined in hashtable.h, while preserving the
> RCU-safe behavior with proper RCU variants of the hashtable functions.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  kernel/locking/lockdep.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 4470680f02269..160cf8310eda0 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -57,6 +57,7 @@
>  #include <linux/lockdep.h>
>  #include <linux/context_tracking.h>
>  #include <linux/console.h>
> +#include <linux/hashtable.h>
>  
>  #include <asm/sections.h>
>  
> @@ -212,8 +213,7 @@ static DECLARE_BITMAP(list_entries_in_use, MAX_LOCKDEP_ENTRIES);
>   * in use.
>   */
>  #define KEYHASH_BITS		(MAX_LOCKDEP_KEYS_BITS - 1)
> -#define KEYHASH_SIZE		(1UL << KEYHASH_BITS)
> -static struct hlist_head lock_keys_hash[KEYHASH_SIZE];
> +static DEFINE_HASHTABLE(lock_keys_hash, KEYHASH_BITS);
>  unsigned long nr_lock_classes;
>  unsigned long nr_zapped_classes;
>  unsigned long max_lock_class_idx;
> @@ -1209,32 +1209,28 @@ static void init_data_structures_once(void)
>  	init_chain_block_buckets();
>  }
>  
> -static inline struct hlist_head *keyhashentry(const struct lock_class_key *key)
> -{
> -	unsigned long hash = hash_long((uintptr_t)key, KEYHASH_BITS);
> -
> -	return lock_keys_hash + hash;
> -}
>  
>  /* Register a dynamically allocated key. */
>  void lockdep_register_key(struct lock_class_key *key)
>  {
> -	struct hlist_head *hash_head;
>  	struct lock_class_key *k;
> +	unsigned long hash;
>  	unsigned long flags;
>  
>  	if (WARN_ON_ONCE(static_obj(key)))
>  		return;
> -	hash_head = keyhashentry(key);
> +
> +	hash = hash_long((uintptr_t)key, KEYHASH_BITS);
>  
>  	raw_local_irq_save(flags);
>  	if (!graph_lock())
>  		goto restore_irqs;
> -	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
> +
> +	hash_for_each_possible_rcu(lock_keys_hash, k, hash_entry, hash) {
>  		if (WARN_ON_ONCE(k == key))
>  			goto out_unlock;
>  	}
> -	hlist_add_head_rcu(&key->hash_entry, hash_head);
> +	hash_add_rcu(lock_keys_hash, &key->hash_entry, hash);
>  out_unlock:
>  	graph_unlock();
>  restore_irqs:
> @@ -1245,8 +1241,8 @@ EXPORT_SYMBOL_GPL(lockdep_register_key);
>  /* Check whether a key has been registered as a dynamic key. */
>  static bool is_dynamic_key(const struct lock_class_key *key)
>  {
> -	struct hlist_head *hash_head;
>  	struct lock_class_key *k;
> +	unsigned long hash;
>  	bool found = false;
>  
>  	if (WARN_ON_ONCE(static_obj(key)))
> @@ -1260,10 +1256,10 @@ static bool is_dynamic_key(const struct lock_class_key *key)
>  	if (!debug_locks)
>  		return true;
>  
> -	hash_head = keyhashentry(key);
> +	hash = hash_long((uintptr_t)key, KEYHASH_BITS);
>  
>  	rcu_read_lock();
> -	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
> +	hash_for_each_possible_rcu(lock_keys_hash, k, hash_entry, hash) {
>  		if (k == key) {
>  			found = true;
>  			break;
> @@ -6561,9 +6557,9 @@ void lockdep_reset_lock(struct lockdep_map *lock)
>   */
>  void lockdep_unregister_key(struct lock_class_key *key)
>  {
> -	struct hlist_head *hash_head = keyhashentry(key);
>  	struct lock_class_key *k;
>  	struct pending_free *pf;
> +	unsigned long hash;
>  	unsigned long flags;
>  	bool found = false;
>  	bool need_callback = false;
> @@ -6573,12 +6569,14 @@ void lockdep_unregister_key(struct lock_class_key *key)
>  	if (WARN_ON_ONCE(static_obj(key)))
>  		return;
>  
> +	hash = hash_long((uintptr_t)key, KEYHASH_BITS);
> +
>  	raw_local_irq_save(flags);
>  	lockdep_lock();
>  
> -	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
> +	hash_for_each_possible(lock_keys_hash, k, hash_entry, hash) {
>  		if (k == key) {
> -			hlist_del_rcu(&k->hash_entry);
> +			hash_del_rcu(&k->hash_entry);
>  			found = true;
>  			break;
>  		}
> -- 
> 2.39.5
> 

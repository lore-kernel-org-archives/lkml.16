Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341F1A83F5;
	Thu,  3 Jul 2025 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551858; cv=none; b=Nzk/6DEeQ03mXBd0P/WyZC2lCkRuLXaljbVbhHl/92ak71oCjInfR7QRQDstrbCnwvKGD3zFm4bvVtR+1/zk47VcJDyKpemRsq4IvdCyF8t+s4KzFo3WJl8QBB6zA33Qnht91B9dRsGj8qfBOBZWkMdhSyeGLcIAzi6Oqv6Kwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551858; c=relaxed/simple;
	bh=jX6AHlesBP+K64VRKPHQJz2QTAfw4aq/qoFApEzOjhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JIkngl1WtTUT9ucoubUeCFhy24Mx7PWqg/1rClS7odXryWQhE9LJUAcZPDsT5SgEHZBz4UrgIkPvZ1+edHwYp/ZDwbyjCEvlIXGz4Es+Pr6i2gX0NHdmMR0z9FX8ncZKUe83VVoeigODKStq6pBI2JZzVdrcZtu7eritCLNNZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ggd98dDw; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ggd98dDw"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 70B3D406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751551854; bh=VmiR0v/cpVL++YCOgvxMwiHyRVgJNLteSEBmnJPrDO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ggd98dDwbaNqjvR2NIR+/IYdh0FA07QbbYRFH2HJmmC90GbqATlefY/G+HMRR8UGw
	 498fX2YRCaXy/wHJ6DsgBU17jSjuA84dj21jpMJMQDWigkpy58CTaovGYT/AjREQrV
	 aOzOr+3RNzk7Mn526p3DTVCPRJylDdsDsRduyo3gDbNNNAahtLI+z5Wf7CZ8Fys6o2
	 p6WH7IE3cTzHc/38L8czqH8t2y9qw0p20t9zqL/TSkESUMVtdza8Bk9iiFQZKMDEPc
	 E+856XaOStIGttYSPNRQnX3sTLuY4m3mk+UDgxcil5w1y0FbnubrpDivUW+9CAjDpG
	 E0YrCIKzt6TiA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 70B3D406FC;
	Thu,  3 Jul 2025 14:10:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel@collabora.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas
 Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2] docs: document linked lists
In-Reply-To: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
Date: Thu, 03 Jul 2025 08:10:53 -0600
Message-ID: <874ivtmkk2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thanks for doing this!

I have a few comments, most of which are just nits.  I think we should
be able to get this in for 6.17.

Nicolas Frattaroli <nicolas.frattaroli@collabora.com> writes:

> The kernel contains various generic data structures that should ideally
> not be reinvented. However, it often fails to document the usage of
> these in the in-tree kernel documentation beyond just a listing of
> header symbols in the very lengthy kernel-api docs page. This is fine
> for things that have simple invocations, but occasionally things devolve
> into several layers of concatenating macros, which are subpar for humans
> to parse.

We don't really need the above in the changelog - just say what you're
doing.

> Begin making a small impact by adding some rudimentary example-driven
> documentation for the linked list functions. Many aspects are covered,
> though it is not an exhaustive listing of the entire set of list
> operations. We also direct readers towards further documentation should
> they be interested in concurrency.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> This series started out with a much more ambitious goal of documenting
> every undocumented generic kernel data structure. About 6 hours in I had
> to tell myself that maybe it's better to do this piece-meal. So here is
> the first of what will hopefully be many similar series: documenting
> linked lists.
>
> As an aside note, I didn't set out to exclusively use Swiss clowns in my
> examples, but as I reached for more names to illustrate longer lists, I
> discovered that the tiny nation of Switzerland has a rich history of
> clowning. You learn something new every day.
>
> For future en-beautification, we could add integration for svgbob
> (<https://github.com/ivanceras/svgbob>) into the kernel docs sphinx in
> the future, which would let us generate drawn diagrams from the text
> doodles, therefore serving both audiences a satisfactory viewing
> experience.
>
> Based against lwn/docs-next, but b4 should let you know already.
> ---
> Changes in v2:
> - drop unrelated sphinx theme patch.
> - replace graphviz diagrams with simpler ascii art in literal blocks,
>   which omit the back edges for clarity and are readable as plain text.
> - add explanatory paragraphs after every diagram that describe what is
>   depicted in plain English. This is to help users that use assistive
>   technologies like screen readers.
> - add examples illustrating the use of list_cut_position and
>   list_cut_before.
> - add examples illustrating the use of list_move, list_move_tail and
>   list_bulk_move_tail.
> - add examples illustrating the use of list_rotate_left and
>   list_rotate_to_front.
> - add example illustrating the use of list_swap.
> - add example illustrating the use of list_splice, and its caveats with
>   regards to stale pointers.
> - Link to v1: https://lore.kernel.org/r/20250520-linked-list-docs-v1-0-db74f7449785@collabora.com
> ---
>  Documentation/core-api/index.rst |   1 +
>  Documentation/core-api/list.rst  | 847 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 848 insertions(+)
>
> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
> index 7a4ca18ca6e2d37644553cfcb0c41c9f05513294..a03a99c2cac56f4ade418f43da723e49216b1062 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -54,6 +54,7 @@ Library functionality that is used throughout the kernel.
>     union_find
>     min_heap
>     parser
> +   list
>  
>  Low level entry and exit
>  ========================
> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..b0586056abb04d2bcc4518f7238ff9a94d3dd774
> --- /dev/null
> +++ b/Documentation/core-api/list.rst
> @@ -0,0 +1,847 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=====================
> +Linked Lists in Linux
> +=====================
> +
> +:Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +.. contents::
> +
> +Introduction
> +============
> +
> +Linked lists are one of the most basic data structures used in many programs.
> +The Linux kernel implements several different flavours of linked lists. The
> +purpose of this document is not to explain linked lists in general, but to show
> +new kernel developers how to use the Linux kernel implementations of linked
> +lists.
> +
> +Please note that while linked lists certainly are ubiquitous, they may not
> +always be the best data structure to use in cases where a simple array doesn't
> +already suffice. Familiarizing oneself with other in-kernel generic data
> +structures, especially for concurrent accesses, is highly encouraged.

I wonder if this should be made just a bit stronger, given that linked
lists are positively out of favor for situations where cache behavior
matters.

> +Linux implementation of doubly linked lists
> +===========================================
> +
> +Linux's linked list implementations can be used by including the header file
> +``<linux/list.h>``.
> +
> +The doubly-linked list will likely be the most familiar to many readers. It's a
> +list that can efficiently be traversed forwards and backwards.
> +
> +The Linux kernel's doubly-linked list is circular in nature. This means that to
> +get from the head node to the tail, we can just travel one edge backwards.
> +Similarly, to get from the tail node to the head, we can simply travel forwards
> +"beyond" the tail and arrive back at the head.
> +
> +Declaring a node
> +----------------
> +
> +A node in a doubly-linked list is declared by adding a ``struct list_head``
> +member to the struct you wish to be contained in the list:
> +
> +.. code-block:: c
> +
> +  struct clown {
> +          unsigned long long shoe_size;
> +          const char *name;
> +          struct list_head node;  /* the aforementioned member */
> +  };
> +
> +This may be an unfamiliar approach to some, as the classical explanation of a
> +linked list is a list node struct with pointers to the previous and next list
> +node, as well the payload data. Linux chooses this approach because it allows
> +for generic list modification code regardless of what data struct is contained

data *structure*

> +within the list. Since the ``struct list_head`` member is not a pointer but part

Better to just say "struct list_head", and the automarkup logic should
take care of the rest.

> +of the struct proper, the ``container_of`` pattern can be used by the list

Here too - just container_of().  I note we don't have documentation for
that macro, which seems like a big oversight.

> +implementation to access the payload data regardless of its type, while staying
> +oblivious to what said type actually is.

I do wonder if you should start by showing the list_head structure
itself?  It is simple enough and not a secret that needs to be kept.

> +Declaring and initializing a list
> +---------------------------------
> +
> +A doubly-linked list can then be declared as just another ``struct list_head``,
> +and initialised with the LIST_HEAD_INIT() macro during initial assignment, or
> +with the INIT_LIST_HEAD() function later:
> +
> +.. code-block:: c
> +
> +  struct clown_car {
> +          int tyre_pressure[4];
> +          struct list_head clowns;        /* Looks like a node! */
> +  };
> +
> +  /* ... Somewhere later in our driver ... */
> +
> +  static int circus_init(struct circus_priv *circus)
> +  {
> +          struct clown_car other_car = {
> +                .tyre_pressure = {10, 12, 11, 9},
> +                .clowns = LIST_HEAD_INIT(other_car.clowns)
> +          };
> +
> +          circus->car.clowns = INIT_LIST_HEAD(&circus->car.clowns);
> +
> +          return 0;
> +  }
> +
> +A further point of confusion to some may be that the list itself doesn't really
> +have its own type. The concept of the entire linked list and a
> +``struct list_head`` member that points to other entries in the list are one and
> +the same.
> +
> +Adding nodes to the list
> +------------------------
> +
> +Adding a node to the linked list is done through the list_add() function.

Nitly, but list_add() is a macro

> +We'll return to our clown car example to illustrate how nodes get added to the
> +list:
> +
> +.. code-block:: c
> +
> +  static int circus_fill_car(struct circus_priv *circus)
> +  {
> +          struct clown_car *car = &circus->car;
> +          struct clown *grock;
> +          struct clown *dimitri;
> +
> +          /* State 1 */
> +
> +          grock = kzalloc(sizeof(*grock), GFP_KERNEL);
> +          if (!grock)
> +                  return -ENOMEM;
> +          grock->name = "Grock";
> +          grock->shoe_size = 1000;
> +
> +          /* Note that we're adding the "node" member */
> +          list_add(&grock->node, &car->clowns);
> +
> +          /* State 2 */
> +
> +          dimitri = kzalloc(sizeof(*dimitri), GFP_KERNEL);
> +          if (!dimitri)
> +                  return -ENOMEM;
> +          dimitri->name = "Dimitri";
> +          dimitri->shoe_size = 50;
> +
> +          list_add(&dimitri->node, &car->clowns);
> +
> +          /* State 3 */
> +
> +          return 0;
> +  }
> +
> +In State 1, our list of clowns is still empty::
> +
> +         .------.
> +         v      |
> +    .--------.  |
> +    | clowns |--'
> +    '--------'
> +
> +This diagram shows the singular "clowns" node pointing at itself. In this
> +diagram, and all following diagrams, only the forward edges are shown, to aid in
> +clarity.
> +
> +In State 2, we've added Grock after the list head::
> +
> +         .--------------------.
> +         v                    |
> +    .--------.     .-------.  |
> +    | clowns |---->| Grock |--'
> +    '--------'     '-------'
> +
> +This diagram shows the "clowns" node pointing at a new node labeled "Grock".
> +The Grock node is pointing back at the "clowns" node.
> +
> +In State 3, we've added Dimitri after the list head, resulting in the following::
> +
> +         .------------------------------------.
> +         v                                    |
> +    .--------.     .---------.     .-------.  |
> +    | clowns |---->| Dimitri |---->| Grock |--'
> +    '--------'     '---------'     '-------'
> +
> +This diagram shows the "clowns" node pointing at a new node labeled "Dimitri",
> +which then points at the node labeled "Grock". The "Grock" node still points
> +back at the "clowns" node.
> +
> +If we wanted to have Dimitri inserted at the end of the list instead, we'd use
> +list_add_tail(). Our code would then look like this:
> +
> +.. code-block:: c
> +
> +  static int circus_fill_car(struct circus_priv *circus)
> +  {
> +          /* ... */
> +
> +          list_add_tail(&dimitri->node, &car->clowns);
> +
> +          /* State 3b */
> +
> +          return 0;
> +  }
> +
> +This results in the following list::
> +
> +         .------------------------------------.
> +         v                                    |
> +    .--------.     .-------.     .---------.  |
> +    | clowns |---->| Grock |---->| Dimitri |--'
> +    '--------'     '-------'     '---------'
> +
> +This diagram shows the "clowns" node pointing at the node labeled "Grock",
> +which points at the new node labeled "Dimitri". The node labeled "Dimitri"
> +points back at the "clowns" node.
> +
> +Traversing the list
> +-------------------
> +
> +To iterate the list, we can loop through all nodes within the list with
> +list_for_each().
> +
> +In our clown example, this results in the following somewhat awkward code:
> +
> +.. code-block:: c
> +
> +  static unsigned long long circus_get_max_shoe_size(struct circus_priv *circus)
> +  {
> +          unsigned long long res = 0;
> +          struct clown *e;
> +          struct list_head *cur;
> +
> +          list_for_each(cur, &circus->car.clowns) {
> +                  e = list_entry(cur, struct clown, node);
> +                  if (e->shoe_size > res)
> +                          res = e->shoe_size;
> +          }
> +
> +          return res;
> +  }
> +
> +Note how the additional ``list_entry`` call is a little awkward here. It's only
> +there because we're iterating through the ``node`` members, but we really want
> +to iterate through the payload, i.e. the ``struct clown`` that contains each
> +node's ``struct list_head``. For this reason, there is a second macro:
> +list_for_each_entry()

You don't say what list_entry() is actually doing - that seems worth a
sentence.

> +Using it would change our code to something like this:
> +
> +.. code-block:: c
> +
> +  static unsigned long long circus_get_max_shoe_size(struct circus_priv *circus)
> +  {
> +          unsigned long long res = 0;
> +          struct clown *e;
> +
> +          list_for_each_entry(e, &circus->car.clowns, node) {
> +                  if (e->shoe_size > res)
> +                          res = e->shoe_size;
> +          }
> +
> +          return res;
> +  }
> +
> +This eliminates the need for the ``list_entry`` step, and our loop cursor is now
> +of the type of our payload. The macro is given the member name that corresponds
> +to the list's ``struct list_head`` within the clown struct so that it can still
> +walk the list.
> +
> +Removing nodes from the list
> +----------------------------
> +
> +The list_del() function can be used to remove entries from the list. It not only
> +removes the given entry from the list, but poisons the entry's ``prev`` and
> +``next`` pointers, so that unintended use of the entry after removal does not
> +go unnoticed.
> +
> +We can extend our previous example to remove one of the entries:
> +
> +.. code-block:: c
> +
> +  static int circus_fill_car(struct circus_priv *circus)
> +  {
> +          /* ... */
> +
> +          list_add(&dimitri->node, &car->clowns);
> +
> +          /* State 3 */
> +
> +          list_del(&dimitri->node);
> +
> +          /* State 4 */
> +
> +          return 0;
> +  }
> +
> +The result of this would be this::
> +
> +         .--------------------.
> +         v                    |
> +    .--------.     .-------.  |      .---------.
> +    | clowns |---->| Grock |--'      | Dimitri |
> +    '--------'     '-------'         '---------'
> +
> +This diagram shows the "clowns" node pointing at the node labeled "Grock",
> +which points back at the "clowns" node. Off to the side is a lone node labeled
> +"Dimitri", which has no arrows pointing anywhere.
> +
> +Note how the Dimitri node does not point to itself; its pointers are
> +intentionally set to a "poison" value that the list code refuses to traverse.
> +
> +If we wanted to reinitialize the removed node instead to make it point at itself
> +again like an empty list head, we can use list_del_init() instead:
> +
> +.. code-block:: c
> +
> +  static int circus_fill_car(struct circus_priv *circus)
> +  {
> +          /* ... */
> +
> +          list_add(&dimitri->node, &car->clowns);
> +
> +          /* State 3 */
> +
> +          list_del_init(&dimitri->node);
> +
> +          /* State 4b */
> +
> +          return 0;
> +  }
> +
> +This results in the deleted node pointing to itself again::
> +
> +         .--------------------.           .-------.
> +         v                    |           v       |
> +    .--------.     .-------.  |      .---------.  |
> +    | clowns |---->| Grock |--'      | Dimitri |--'
> +    '--------'     '-------'         '---------'
> +
> +This diagram shows the "clowns" node pointing at the node labeled "Grock",
> +which points back at the "clowns" node. Off to the side is a lone node labeled
> +"Dimitri", which points to itself.
> +
> +Traversing whilst removing nodes
> +--------------------------------
> +
> +Deleting entries while we're traversing the list will cause problems if we use
> +list_for_each() and list_for_each_entry(), as deleting the current entry would
> +modify the ``next`` pointer of it, which means the traversal can't properly
> +advance to the next list entry.
> +
> +There is a solution to this however: list_for_each_safe() and
> +list_for_each_entry_safe(). These take an additional parameter of a pointer to
> +a ``struct list_head`` to use as temporary storage for the next entry during,
> +iteration, solving the issue.
> +
> +An example of how to use it:
> +
> +.. code-block:: c
> +
> +  static void circus_eject_insufficient_clowns(struct circus_priv *circus)
> +  {
> +          struct clown *e;
> +          struct clown *n;      /* temporary storage for safe iteration */
> +
> +          list_for_each_entry_safe(e, n, &circus->car.clowns, node) {
> +                if (e->shoe_size < 500)
> +                        list_del(&e->node);
> +          }
> +  }
> +
> +Proper memory management (i.e. freeing the deleted node while making sure
> +nothing still references it) in this case is left up as an exercise to the
> +reader.
> +
> +Cutting a list
> +--------------
> +
> +There are two helper functions to cut lists with. Both take elements from the
> +list ``head``, and replace the contents of the list ``list``.
> +
> +The first such function is list_cut_position(). It removes all list entries from
> +``head`` up to and including ``entry``, placing them in ``list`` instead.
> +
> +In this example, it's assumed we start with the following list::
> +
> +         .----------------------------------------------------------------.
> +         v                                                                |
> +    .--------.     .-------.     .---------.     .-----.     .---------.  |
> +    | clowns |---->| Grock |---->| Dimitri |---->| Pic |---->| Alfredo |--'
> +    '--------'     '-------'     '---------'     '-----'     '---------'
> +
> +This diagram depicts the list head "clowns" pointing to a node labeled "Grock",
> +which points to a node labeled "Dimitri", which points to a node labeled
> +"Pic", which points to a node labeled "Alfredo", which points back to the
> +"clowns" list head.

There comes a point, I think, where the (very nice) diagrams speak for
themselves; I'm not entirely sure it needs to be spelled out in this
much detail.  By this point, I would expect readers to be just skipping
over these descriptions.

> +With the following code, every clown up to and including "Pic" is moved from
> +the "clowns" list head to a separate ``struct list_head`` initialized at local
> +stack variable ``retirement``:

[...]


> +Further reading
> +---------------
> +
> +* `How does the kernel implements Linked Lists? - KernelNewbies <https://kernelnewbies.org/FAQ/LinkedLists>`_

I do still think you should move the kerneldoc for lists over from
kernel-api.rst; just tack it onto the end here.

Thanks,

jon

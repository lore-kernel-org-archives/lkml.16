Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F44322D4C0;
	Thu,  3 Jul 2025 03:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751513050; cv=none; b=BDcphdsuZO2NrcybHuxNGmjXvwD5UtWlny2MDm/mgCFRcGcruMaTf5G1iwnrXeXwim8bYds2fesy4GRrO/4uk1aNGOGSAAvJKrz5/an3jKN+y3HEkp+yfJoEFtUi/JRKvCCv79YyOEAebkxnglBDs5YhIbgMRfyFGaxOkUeU+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751513050; c=relaxed/simple;
	bh=5PlgyGPP+NBAbGB/D+qgedl/dklMu+dZNv/SMeRqQvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWhdjoVlNeOEfmmgfeV/+WEwqkXVNCTywsNuKiHall+D6DBOyEy2A0R75TBPZaXRVMFOYY/l2JpFVPSBoom+03kgTiZhOzsv9NoKQhd9GGfiIXtD8pwWXahmt1wbd91n01TS/NvMp0MhRG0IFfn13PxAqAm6swyO/EQzCGApoFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORmDHc5i; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORmDHc5i"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b34c068faf8so7896513a12.2;
        Wed, 02 Jul 2025 20:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751513047; x=1752117847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VnnDRj/WX6miir/Od33OIt+cpm/szpdbaXdafXOK7IU=;
        b=ORmDHc5imKj9K4cC3OzuqsoQS91v7wNW2vvZNXc+AOVvdNViJ1P79WTAKCNUI5NooR
         zhlnONkPKwUZYaflu9ysGVq8aUME9pF/3kHKfWNUm4MpPOycmy8VuzH9EbJOKXiIXxRk
         1ePz+sRnh5gcFsHfw1ffAT2QDOqTVwZ8rs1Dt+2BtyWQdqT6YOfKQvSTXWdzTOH4A9sB
         tKr2sr9iU7lf9k33DaMFQisMudCh+IzY95klC7B47yxisCkZepYIeQLojDPuGhCqga3U
         gsSplLh18t+siclrY7cl5aZc4CkVPhKyIZmwLBASKmLXnLCIC1cyWlrt+m/lI8bFKR8X
         l8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751513047; x=1752117847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnnDRj/WX6miir/Od33OIt+cpm/szpdbaXdafXOK7IU=;
        b=NRbugZ5iDaK1Nd2QhE4xSWYGkzTCh1poUwl5RQhQXdGNo1TIMD2Tf6Ie548LLfr2Id
         4kqb76q9FT3x7H083fRpJiGJLsJlaJqZjqvQyo8A7gLwBh0FYFFuJ6za2wyypDvcVLkm
         4IhxbgTBcX3UWqpnHjEqL/XcX3enmwrkWarYHh2/+G+geLQE1j/98/xt7FmCySUsiSTe
         RYr8bmKQ+7O66UAkWcN2UVPAfcCMC1RajLtH+MhGQVhupY5gaV3kdrSi5fQqgJTAPs+Y
         mXtzfSOZ6v0bUp+VF+GNLxW+/pcJOPRyhBgXax2ozHjEyi+YjcszrYgsIhA2xOPTxjOE
         cUuw==
X-Forwarded-Encrypted: i=1; AJvYcCUZAS4VBCmFmMOkxP76OfhY3s5LRqKxHiuXdAzet+EYrujuiqnvIp8JsUpt4QMkX0Kz22dbykNLoiLWsgmr@vger.kernel.org, AJvYcCW2S3R/0iIIZFDM7tiWag/dAygsECPcHFe4a1U54I/gc65JAPtnEl5pu6dhogqwvOnYxrj9yvLQJP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Q7EOGbjRqz+gZ0gtva5jxc/watYGRCYiHXvEpGbqtGVvZo/k
	SXjX3oqjRahR4TAHMHz4/u0p1ZhKeW9ihTJJH9pndOSwFYIVzY0HrnAp
X-Gm-Gg: ASbGncs59c6XhfGOpZIJHZpNSRPzX+1K4BoehdR/7IL+5Lz4am6JuuuiPJx6rWD5/sH
	gidP0/Kz0kE0+SRONgJQPGdgyXDc/bE4tkge31XSapuRrdr4vTGofWN5/xMZm383GRAJhxvfldL
	SgNv2XHK3voP9pfAdN7Sl86pQS31UHAGhNk4xzbjMClZkGlX+ZbVWxQ+LFXGPK9qY+kLST847rJ
	N82DkIXF8JpFWFuiLoAjuLpdSvk07tvYrxFauHBQfNG403mUj3/qoxymYsvI18WOAFBwbKICmiQ
	tggkaPi2xeEWDs9IK9RL5h94fJDOtjmlN4nZVqDf2kbTlb6vXpoVlDEW1Xuj8w==
X-Google-Smtp-Source: AGHT+IFBlL6co+QmhfrKDiE3VStTmpcyCImuw3WU2C2BQidIUQyQHGqxIr8BfUbOksZh5CoOQBQxeA==
X-Received: by 2002:a17:90a:c2cb:b0:313:279d:665c with SMTP id 98e67ed59e1d1-31a90afe4dcmr8654948a91.7.1751513046683;
        Wed, 02 Jul 2025 20:24:06 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc8fe33sm994637a91.44.2025.07.02.20.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 20:24:05 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E02A04206887; Thu, 03 Jul 2025 10:24:00 +0700 (WIB)
Date: Thu, 3 Jul 2025 10:24:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel@collabora.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: document linked lists
Message-ID: <aGX30ATQaD2EjWwW@archie.me>
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HLMd7kwOtYwC3JP8"
Content-Disposition: inline
In-Reply-To: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>


--HLMd7kwOtYwC3JP8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 10:24:47PM +0200, Nicolas Frattaroli wrote:
> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/lis=
t.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..b0586056abb04d2bcc4518f72=
38ff9a94d3dd774
> --- /dev/null
> +++ b/Documentation/core-api/list.rst
> @@ -0,0 +1,847 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Linked Lists in Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +.. contents::
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Linked lists are one of the most basic data structures used in many prog=
rams.
> +The Linux kernel implements several different flavours of linked lists. =
The
> +purpose of this document is not to explain linked lists in general, but =
to show
> +new kernel developers how to use the Linux kernel implementations of lin=
ked
> +lists.
> +
> +Please note that while linked lists certainly are ubiquitous, they may n=
ot
> +always be the best data structure to use in cases where a simple array d=
oesn't
> +already suffice. Familiarizing oneself with other in-kernel generic data
> +structures, especially for concurrent accesses, is highly encouraged.
> +
> +Linux implementation of doubly linked lists
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Linux's linked list implementations can be used by including the header =
file
> +``<linux/list.h>``.
> +
> +The doubly-linked list will likely be the most familiar to many readers.=
 It's a
> +list that can efficiently be traversed forwards and backwards.
> +
> +The Linux kernel's doubly-linked list is circular in nature. This means =
that to
> +get from the head node to the tail, we can just travel one edge backward=
s.
> +Similarly, to get from the tail node to the head, we can simply travel f=
orwards
> +"beyond" the tail and arrive back at the head.
> +
> +Declaring a node
> +----------------
> +
> +A node in a doubly-linked list is declared by adding a ``struct list_hea=
d``
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
> +This may be an unfamiliar approach to some, as the classical explanation=
 of a
> +linked list is a list node struct with pointers to the previous and next=
 list
> +node, as well the payload data. Linux chooses this approach because it a=
llows
> +for generic list modification code regardless of what data struct is con=
tained
> +within the list. Since the ``struct list_head`` member is not a pointer =
but part
> +of the struct proper, the ``container_of`` pattern can be used by the li=
st
> +implementation to access the payload data regardless of its type, while =
staying
> +oblivious to what said type actually is.
> +
> +Declaring and initializing a list
> +---------------------------------
> +
> +A doubly-linked list can then be declared as just another ``struct list_=
head``,
> +and initialised with the LIST_HEAD_INIT() macro during initial assignmen=
t, or
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
> +          struct clown_car other_car =3D {
> +                .tyre_pressure =3D {10, 12, 11, 9},
> +                .clowns =3D LIST_HEAD_INIT(other_car.clowns)
> +          };
> +
> +          circus->car.clowns =3D INIT_LIST_HEAD(&circus->car.clowns);
> +
> +          return 0;
> +  }
> +
> +A further point of confusion to some may be that the list itself doesn't=
 really
> +have its own type. The concept of the entire linked list and a
> +``struct list_head`` member that points to other entries in the list are=
 one and
> +the same.
> +
> +Adding nodes to the list
> +------------------------
> +
> +Adding a node to the linked list is done through the list_add() function.
> +
> +We'll return to our clown car example to illustrate how nodes get added =
to the
> +list:
> +
> +.. code-block:: c
> +
> +  static int circus_fill_car(struct circus_priv *circus)
> +  {
> +          struct clown_car *car =3D &circus->car;
> +          struct clown *grock;
> +          struct clown *dimitri;
> +
> +          /* State 1 */
> +
> +          grock =3D kzalloc(sizeof(*grock), GFP_KERNEL);
> +          if (!grock)
> +                  return -ENOMEM;
> +          grock->name =3D "Grock";
> +          grock->shoe_size =3D 1000;
> +
> +          /* Note that we're adding the "node" member */
> +          list_add(&grock->node, &car->clowns);
> +
> +          /* State 2 */
> +
> +          dimitri =3D kzalloc(sizeof(*dimitri), GFP_KERNEL);
> +          if (!dimitri)
> +                  return -ENOMEM;
> +          dimitri->name =3D "Dimitri";
> +          dimitri->shoe_size =3D 50;
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
> +diagram, and all following diagrams, only the forward edges are shown, t=
o aid in
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
> +This diagram shows the "clowns" node pointing at a new node labeled "Gro=
ck".
> +The Grock node is pointing back at the "clowns" node.
> +
> +In State 3, we've added Dimitri after the list head, resulting in the fo=
llowing::
> +
> +         .------------------------------------.
> +         v                                    |
> +    .--------.     .---------.     .-------.  |
> +    | clowns |---->| Dimitri |---->| Grock |--'
> +    '--------'     '---------'     '-------'
> +
> +This diagram shows the "clowns" node pointing at a new node labeled "Dim=
itri",
> +which then points at the node labeled "Grock". The "Grock" node still po=
ints
> +back at the "clowns" node.
> +
> +If we wanted to have Dimitri inserted at the end of the list instead, we=
'd use
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
> +This diagram shows the "clowns" node pointing at the node labeled "Grock=
",
> +which points at the new node labeled "Dimitri". The node labeled "Dimitr=
i"
> +points back at the "clowns" node.
> +
> +Traversing the list
> +-------------------
> +
> +To iterate the list, we can loop through all nodes within the list with
> +list_for_each().
> +
> +In our clown example, this results in the following somewhat awkward cod=
e:
> +
> +.. code-block:: c
> +
> +  static unsigned long long circus_get_max_shoe_size(struct circus_priv =
*circus)
> +  {
> +          unsigned long long res =3D 0;
> +          struct clown *e;
> +          struct list_head *cur;
> +
> +          list_for_each(cur, &circus->car.clowns) {
> +                  e =3D list_entry(cur, struct clown, node);
> +                  if (e->shoe_size > res)
> +                          res =3D e->shoe_size;
> +          }
> +
> +          return res;
> +  }
> +
> +Note how the additional ``list_entry`` call is a little awkward here. It=
's only
> +there because we're iterating through the ``node`` members, but we reall=
y want
> +to iterate through the payload, i.e. the ``struct clown`` that contains =
each
> +node's ``struct list_head``. For this reason, there is a second macro:
> +list_for_each_entry()
> +
> +Using it would change our code to something like this:
> +
> +.. code-block:: c
> +
> +  static unsigned long long circus_get_max_shoe_size(struct circus_priv =
*circus)
> +  {
> +          unsigned long long res =3D 0;
> +          struct clown *e;
> +
> +          list_for_each_entry(e, &circus->car.clowns, node) {
> +                  if (e->shoe_size > res)
> +                          res =3D e->shoe_size;
> +          }
> +
> +          return res;
> +  }
> +
> +This eliminates the need for the ``list_entry`` step, and our loop curso=
r is now
> +of the type of our payload. The macro is given the member name that corr=
esponds
> +to the list's ``struct list_head`` within the clown struct so that it ca=
n still
> +walk the list.
> +
> +Removing nodes from the list
> +----------------------------
> +
> +The list_del() function can be used to remove entries from the list. It =
not only
> +removes the given entry from the list, but poisons the entry's ``prev`` =
and
> +``next`` pointers, so that unintended use of the entry after removal doe=
s not
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
> +This diagram shows the "clowns" node pointing at the node labeled "Grock=
",
> +which points back at the "clowns" node. Off to the side is a lone node l=
abeled
> +"Dimitri", which has no arrows pointing anywhere.
> +
> +Note how the Dimitri node does not point to itself; its pointers are
> +intentionally set to a "poison" value that the list code refuses to trav=
erse.
> +
> +If we wanted to reinitialize the removed node instead to make it point a=
t itself
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
> +This diagram shows the "clowns" node pointing at the node labeled "Grock=
",
> +which points back at the "clowns" node. Off to the side is a lone node l=
abeled
> +"Dimitri", which points to itself.
> +
> +Traversing whilst removing nodes
> +--------------------------------
> +
> +Deleting entries while we're traversing the list will cause problems if =
we use
> +list_for_each() and list_for_each_entry(), as deleting the current entry=
 would
> +modify the ``next`` pointer of it, which means the traversal can't prope=
rly
> +advance to the next list entry.
> +
> +There is a solution to this however: list_for_each_safe() and
> +list_for_each_entry_safe(). These take an additional parameter of a poin=
ter to
> +a ``struct list_head`` to use as temporary storage for the next entry du=
ring,
> +iteration, solving the issue.
> +
> +An example of how to use it:
> +
> +.. code-block:: c
> +
> +  static void circus_eject_insufficient_clowns(struct circus_priv *circu=
s)
> +  {
> +          struct clown *e;
> +          struct clown *n;      /* temporary storage for safe iteration =
*/
> +
> +          list_for_each_entry_safe(e, n, &circus->car.clowns, node) {
> +                if (e->shoe_size < 500)
> +                        list_del(&e->node);
> +          }
> +  }
> +
> +Proper memory management (i.e. freeing the deleted node while making sure
> +nothing still references it) in this case is left up as an exercise to t=
he
> +reader.
> +
> +Cutting a list
> +--------------
> +
> +There are two helper functions to cut lists with. Both take elements fro=
m the
> +list ``head``, and replace the contents of the list ``list``.
> +
> +The first such function is list_cut_position(). It removes all list entr=
ies from
> +``head`` up to and including ``entry``, placing them in ``list`` instead.
> +
> +In this example, it's assumed we start with the following list::
> +
> +         .--------------------------------------------------------------=
--.
> +         v                                                              =
  |
> +    .--------.     .-------.     .---------.     .-----.     .---------.=
  |
> +    | clowns |---->| Grock |---->| Dimitri |---->| Pic |---->| Alfredo |=
--'
> +    '--------'     '-------'     '---------'     '-----'     '---------'
> +
> +This diagram depicts the list head "clowns" pointing to a node labeled "=
Grock",
> +which points to a node labeled "Dimitri", which points to a node labeled
> +"Pic", which points to a node labeled "Alfredo", which points back to the
> +"clowns" list head.
> +
> +With the following code, every clown up to and including "Pic" is moved =
=66rom
> +the "clowns" list head to a separate ``struct list_head`` initialized at=
 local
> +stack variable ``retirement``:
> +
> +.. code-block:: c
> +
> +  static void circus_retire_clowns(struct circus_priv *circus)
> +  {
> +          struct list_head retirement =3D LIST_HEAD_INIT(retirement);
> +          struct clown *grock, *dimitri, *pic, *alfredo;
> +          struct clown_car *car =3D &circus->car;
> +
> +          /* ... clown initialization, list adding ... */
> +
> +          list_cut_position(&retirement, &car->clowns, &pic->node);
> +
> +          /* State 1 */
> +  }
> +
> +The resulting ``car->clowns`` list would be this::
> +
> +         .----------------------.
> +         v                      |
> +    .--------.     .---------.  |
> +    | clowns |---->| Alfredo |--'
> +    '--------'     '---------'
> +
> +This diagram depicts the "clowns" list head at State 1, with "clowns" po=
inting
> +to a node labeled "Alfredo", which points back at the "clowns" list head.
> +
> +Meanwhile, the ``retirement`` list is transformed to the following::
> +
> +           .--------------------------------------------------.
> +           v                                                  |
> +    .------------.     .-------.     .---------.     .-----.  |
> +    | retirement |---->| Grock |---->| Dimitri |---->| Pic |--'
> +    '------------'     '-------'     '---------'     '-----'
> +
> +This diagram depicts the list head "retirement" at State 1, with "retire=
ment"
> +pointing to a node labeled "Grock", which points to a node labeled "Dimi=
tri",
> +which in turn points to a node labeled "Pic", which finally points back =
to the
> +"retirement" list head.
> +
> +The second function, list_cut_before(), is much the same, except it cuts=
 before
> +the ``entry`` node, i.e. it removes all list entries from ``head`` up to=
 but
> +excluding ``entry``, placing them in ``list`` instead. This example assu=
mes the
> +same initial starting list as the previous example:
> +
> +.. code-block:: c
> +
> +  static void circus_retire_clowns(struct circus_priv *circus)
> +  {
> +          struct list_head retirement =3D LIST_HEAD_INIT(retirement);
> +          struct clown *grock, *dimitri, *pic, *alfredo;
> +          struct clown_car *car =3D &circus->car;
> +
> +          /* ... clown initialization, list adding ... */
> +
> +          list_cut_before(&retirement, &car->clowns, &pic->node);
> +
> +          /* State 1b */
> +  }
> +
> +The resulting ``car->clowns`` list would be this::
> +
> +         .----------------------------------.
> +         v                                  |
> +    .--------.     .-----.     .---------.  |
> +    | clowns |---->| Pic |---->| Alfredo |--'
> +    '--------'     '-----'     '---------'
> +
> +This diagram depicts the "clowns" list head at State 1b, with "clowns" p=
ointing
> +to a node labeled "Pic", which in turn points to a node labeled "Alfredo=
",
> +which points back at the "clowns" list head.
> +
> +Meanwhile, the ``retirement`` list is transformed to the following::
> +
> +           .--------------------------------------.
> +           v                                      |
> +    .------------.     .-------.     .---------.  |
> +    | retirement |---->| Grock |---->| Dimitri |--'
> +    '------------'     '-------'     '---------'
> +
> +This diagram depicts the "retirement" list at State 1b, with the "retire=
ment"
> +list head pointing at a node labeled "Grock", which in turn points at a =
node
> +labeled "Dimitri", which finally points back at the "retirement" list he=
ad.
> +
> +It should be noted that both functions will destroy links to any existin=
g nodes
> +in the destination ``struct list_head *list``.
> +
> +Moving entries and partial lists
> +--------------------------------
> +
> +The list_move() and list_move_tail() functions can be used to move an en=
try
> +from one list to another, to either the start or end respectively.
> +
> +In the following example, we'll assume we start with two lists ("clowns"=
 and
> +"sidewalk" in the following initial state "State 0"::
> +
> +         .--------------------------------------------------------------=
--.
> +         v                                                              =
  |
> +    .--------.     .-------.     .---------.     .-----.     .---------.=
  |
> +    | clowns |---->| Grock |---->| Dimitri |---->| Pic |---->| Alfredo |=
--'
> +    '--------'     '-------'     '---------'     '-----'     '---------'
> +
> +          .-------------------.
> +          v                   |
> +    .----------.     .-----.  |
> +    | sidewalk |---->| Pio |--'
> +    '----------'     '-----'
> +
> +This diagram depicts two list heads. The first, "clowns", points to a no=
de
> +labeled "Grock", which points to a node labeled "Dimitri", which points =
to a
> +node labeled "Pic", which points to a node labeled "Alfredo", which poin=
ts
> +back at the list head "clowns". The second list head, "sidewalk", points=
 to a
> +node labeled "Pio", which points back to the "sidewalk" list head.
> +
> +We apply the following example code to the two lists:
> +
> +.. code-block:: c
> +
> +  static void circus_clowns_exit_car(struct circus_priv *circus)
> +  {
> +          struct list_head sidewalk =3D LIST_HEAD_INIT(sidewalk);
> +          struct clown *grock, *dimitri, *pic, *alfredo, *pio;
> +          struct clown_car *car =3D &circus->car;
> +
> +          /* ... clown initialization, list adding ... */
> +
> +          /* State 0 */
> +
> +          list_move(&pic->node, &sidewalk);
> +
> +          /* State 1 */
> +
> +          list_move_tail(&dimitri->node, &sidewalk);
> +
> +          /* State 2 */
> +  }
> +
> +In State 1, we arrive at the following situation::
> +
> +        .-----------------------------------------------------.
> +        |                                                     |
> +        v                                                     |
> +    .--------.     .-------.     .---------.     .---------.  |
> +    | clowns |---->| Grock |---->| Dimitri |---->| Alfredo |--'
> +    '--------'     '-------'     '---------'     '---------'
> +
> +          .-------------------------------.
> +          v                               |
> +    .----------.     .-----.     .-----.  |
> +    | sidewalk |---->| Pic |---->| Pio |--'
> +    '----------'     '-----'     '-----'
> +
> +This diagram depicts two list heads. The first, "clowns", points to a no=
de
> +labeled "Grock", which points to a node labeled "Dimitri", which points =
to a
> +node labeled "Alfredo", which points back to the list head "clowns". The=
 node
> +labeled "Pic" is no longer part of the "clowns" list. The second list he=
ad,
> +"sidewalk", points to a node labeled "Pic", which points to a node label=
ed
> +"Pio", which points back to the "sidewalk" list head.
> +
> +In State 2, after we've moved Dimitri to the tail of sidewalk, the situa=
tion
> +changes as follows::
> +
> +        .-------------------------------------.
> +        |                                     |
> +        v                                     |
> +    .--------.     .-------.     .---------.  |
> +    | clowns |---->| Grock |---->| Alfredo |--'
> +    '--------'     '-------'     '---------'
> +
> +          .-----------------------------------------------.
> +          v                                               |
> +    .----------.     .-----.     .-----.     .---------.  |
> +    | sidewalk |---->| Pic |---->| Pio |---->| Dimitri |--'
> +    '----------'     '-----'     '-----'     '---------'
> +
> +This diagram depicts two list heads. The first, "clowns", points to a no=
de
> +labeled "Grock", which points to a node labeled "Alfredo", which points =
back
> +to the list head "clowns". The node labeled "Dimitri" is no longer part =
of the
> +"clowns" list. The second list head, "sidewalk", points to a node labeled
> +"Pic", which points to a node labeled "Pio", which points to a node labe=
led
> +"Dimitri", which points back to the "sidewalk" list head.
> +
> +As long as the source and destination list head are part of the same lis=
t, we
> +can also efficiently bulk move a segment of the list to the tail end of =
the
> +list. We continue the previous example by adding a list_bulk_move_tail()=
 after
> +State 2, moving Pic and Pio to the tail end of the sidewalk list.
> +
> +.. code-block:: c
> +
> +  static void circus_clowns_exit_car(struct circus_priv *circus)
> +  {
> +          struct list_head sidewalk =3D LIST_HEAD_INIT(sidewalk);
> +          struct clown *grock, *dimitri, *pic, *alfredo, *pio;
> +          struct clown_car *car =3D &circus->car;
> +
> +          /* ... clown initialization, list adding ... */
> +
> +          /* State 0 */
> +
> +          list_move(&pic->node, &sidewalk);
> +
> +          /* State 1 */
> +
> +          list_move_tail(&dimitri->node, &sidewalk);
> +
> +          /* State 2 */
> +
> +          list_bulk_move_tail(&sidewalk, &pic->node, &pio->node);
> +
> +          /* State 3 */
> +  }
> +
> +For the sake of brevity, only the altered "sidewalk" list at State 3 is =
depicted
> +in the following diagram::
> +
> +          .-----------------------------------------------.
> +          v                                               |
> +    .----------.     .---------.     .-----.     .-----.  |
> +    | sidewalk |---->| Dimitri |---->| Pic |---->| Pio |--'
> +    '----------'     '---------'     '-----'     '-----'
> +
> +This diagram depicts a list head "sidewalk". It points to at node labeled
> +"Dimitri", which points to a node labeled "Pic", which points to a node
> +labeled "Pio", which points back to the list head "sidewalk".
> +
> +Do note that list_bulk_move_tail() does not do any checking as to whethe=
r all
> +three supplied ``struct list_head *`` parameters really do belong to the=
 same
> +list. If you use it outside the constraints the documentation gives, the=
n the
> +result is a matter between you and the implementation.
> +
> +Rotating entries
> +----------------
> +
> +A common write operation on lists, especially when using them as queues,=
 is
> +to rotate it. A list rotation means entries at the front are sent to the=
 back.
> +
> +For rotation, Linux provides us with two functions: list_rotate_left() a=
nd
> +list_rotate_to_front(). The former can be pictured like a bicycle chain,=
 taking
> +the entry after the supplied ``struct list_head *`` and moving it to the=
 tail,
> +which in essence means the entire list, due to its circular nature, rota=
tes by
> +one position.
> +
> +The latter, list_rotate_to_front(), takes the same concept one step furt=
her:
> +instead of advancing the list by one entry, it advances it *until* the s=
pecified
> +entry is the new front.
> +
> +In the following example, our starting state, State 0, is the following::
> +
> +         .--------------------------------------------------------------=
---.
> +         v                                                              =
   |
> +    .--------.   .-------.   .---------.   .-----.   .---------.   .----=
-. |
> +    | clowns |-->| Grock |-->| Dimitri |-->| Pic |-->| Alfredo |-->| Pio=
 |-'
> +    '--------'   '-------'   '---------'   '-----'   '---------'   '----=
-'
> +
> +This diagram depicts a list head "clowns". It points to a node labeled "=
Grock",
> +which points to a node labeled "Dimitri", which points to a node labeled
> +"Pic", which points to a node labeled "Alfredo", which points to a node
> +labeled "Pio", which finally points back to the "clowns" list head.
> +
> +The example code being used to demonstrate list rotations is the followi=
ng:
> +
> +.. code-block:: c
> +
> +  static void circus_clowns_rotate(struct circus_priv *circus)
> +  {
> +          struct clown *grock, *dimitri, *pic, *alfredo, *pio;
> +          struct clown_car *car =3D &circus->car;
> +
> +          /* ... clown initialization, list adding ... */
> +
> +          /* State 0 */
> +
> +          list_rotate_left(&car->clowns);
> +
> +          /* State 1 */
> +
> +          list_rotate_to_front(&alfredo->node, &car->clowns);
> +
> +          /* State 2 */
> +
> +  }
> +
> +In State 1, we arrive at the following situation::
> +
> +         .--------------------------------------------------------------=
---.
> +         v                                                              =
   |
> +    .--------.   .---------.   .-----.   .---------.   .-----.   .------=
-. |
> +    | clowns |-->| Dimitri |-->| Pic |-->| Alfredo |-->| Pio |-->| Grock=
 |-'
> +    '--------'   '---------'   '-----'   '---------'   '-----'   '------=
-'
> +
> +This diagram depicts a list head "clowns". It points to a node labeled
> +"Dimitri", which points to a node labeled "Pic", which points to a node
> +labeled "Alfredo", which points to a node labeled "Pio", which points to=
 a
> +note labeled "Grock", which finally points back to the "clowns" list hea=
d.
> +
> +Next, after the list_rotate_to_front() call, we arrive in the following
> +State 2::
> +
> +         .--------------------------------------------------------------=
---.
> +         v                                                              =
   |
> +    .--------.   .---------.   .-----.   .-------.   .---------.   .----=
-. |
> +    | clowns |-->| Alfredo |-->| Pio |-->| Grock |-->| Dimitri |-->| Pic=
 |-'
> +    '--------'   '---------'   '-----'   '-------'   '---------'   '----=
-'
> +
> +This diagram depicts a list head "clowns". It points to a node labeled
> +"Alfredo", which points to a node labeled "Pio", which points to a node
> +labeled "Grock", which points to a node labeled "Dimitri", which points =
to a
> +node labeled "Pic", which then finally points back to the "clowns" list =
head.
> +
> +As is hopefully evident from the diagrams, the entries in front of "Alfr=
edo"
> +were cycled to the tail end of the list.
> +
> +Swapping entries
> +----------------
> +
> +Another common operation is that two entries need to be swapped with eac=
h other.
> +
> +For this, Linux provides us with list_swap().
> +
> +In the following example, we have a list with three entries, and swap tw=
o of
> +them. This is our starting state in "State 0"::
> +
> +         .-----------------------------------------.
> +         v                                         |
> +    .--------.   .-------.   .---------.   .-----. |
> +    | clowns |-->| Grock |-->| Dimitri |-->| Pic |-'
> +    '--------'   '-------'   '---------'   '-----'
> +
> +This diagram depicts a list head "clowns". It points to a node labeled "=
Grock",
> +which points to a node labeled "Dimitri", which points to a node labeled
> +"Pic", which finally points back to the "clowns" list head.
> +
> +.. code-block:: c
> +
> +  static void circus_clowns_swap(struct circus_priv *circus)
> +  {
> +          struct clown *grock, *dimitri, *pic;
> +          struct clown_car *car =3D &circus->car;
> +
> +          /* ... clown initialization, list adding ... */
> +
> +          /* State 0 */
> +
> +          list_swap(&dimitri->node, &pic->node);
> +
> +          /* State 1 */
> +  }
> +
> +The resulting list at State 1 is the following::
> +
> +         .-----------------------------------------.
> +         v                                         |
> +    .--------.   .-------.   .-----.   .---------. |
> +    | clowns |-->| Grock |-->| Pic |-->| Dimitri |-'
> +    '--------'   '-------'   '-----'   '---------'
> +
> +This diagram depicts a list head "clowns". It points to a node labeled "=
Grock",
> +which points to a node labeled "Pic", which points to a node labeled
> +"Dimitri", which finally points back to the "clowns" list head.
> +
> +As is evident by comparing the diagrams, the "Pic" and "Dimitri" nodes h=
ave
> +traded places.
> +
> +Splicing two lists together
> +---------------------------
> +
> +Say we have two lists, in the following example one represented by a lis=
t head
> +we call "knie" and one we call "stey". In a hypothetical circus acquisit=
ion,
> +the two list of clowns should be spliced together. The following is our
> +situation in "State 0"::
> +
> +        .-----------------------------------------.
> +        |                                         |
> +        v                                         |
> +    .------.   .-------.   .---------.   .-----.  |
> +    | knie |-->| Grock |-->| Dimitri |-->| Pic |--'
> +    '------'   '-------'   '---------'   '-----'
> +
> +        .-----------------------------.
> +        v                             |
> +    .------.   .---------.   .-----.  |
> +    | stey |-->| Alfredo |-->| Pio |--'
> +    '------'   '---------'   '-----'
> +
> +This diagram depicts two lists. The first list_head, labeled "knie", poi=
nts to
> +a node labeled "Grock", which points to a node labeled "Dimitri", which =
points
> +to a node labeled "Pic", which points back to the "knie" list head. The =
second
> +list_head, labeled "stey", points to a node labeled "Alfredo", which poi=
nts to
> +a node labeled "Pio", which points back to the "stey" list head.
> +
> +The function to splice these two lists together is list_splice(). Our ex=
ample
> +code is as follows:
> +
> +.. code-block:: c
> +
> +  static void circus_clowns_splice(void)
> +  {
> +          struct clown *grock, *dimitri, *pic, *alfredo, *pio;
> +          struct list_head knie =3D LIST_HEAD_INIT(knie);
> +          struct list_head stey =3D LIST_HEAD_INIT(stey);
> +
> +          /* ... Clown allocation and initialization here ... */
> +
> +          list_add_tail(&grock->node, &knie);
> +          list_add_tail(&dimitri->node, &knie);
> +          list_add_tail(&pic->node, &knie);
> +          list_add_tail(&alfredo->node, &stey);
> +          list_add_tail(&pio->node, &stey);
> +
> +          /* State 0 */
> +
> +          list_splice(&stey, &dimitri->node);
> +
> +          /* State 1 */
> +  }
> +
> +The list_splice() call here adds all the entries in ``stey`` to the list
> +``dimitri``'s ``node`` list_head is in, after the ``node`` of ``dimitri`=
`. A
> +somewhat surprising diagram of the resulting "State 1" follows::
> +
> +        .---------------------------------------------------------------=
--.
> +        |                                                               =
  |
> +        v                                                               =
  |
> +    .------.   .-------.   .---------.   .---------.   .-----.   .-----.=
  |
> +    | knie |-->| Grock |-->| Dimitri |-->| Alfredo |-->| Pio |-->| Pic |=
--'
> +    '------'   '-------'   '---------'   '---------'   '-----'   '-----'
> +                                              ^
> +              .-------------------------------'
> +              |
> +    .------.  |
> +    | stey |--'
> +    '------'
> +
> +This diagram depicts a list_head labeled "knie". It points at a node lab=
eled
> +"Grock", which points at a node labeled "Dimitri", which points at a node
> +labeled "Alfredo", which points at a node labeled "Pio", which points at=
 a
> +node labeled "Pic", which points back at the "knie" list head. A second =
list
> +head labeled "stey" still exists. It points at the "Alfredo" node which =
is now
> +part of the "knie" list.
> +
> +Traversing the ``stey`` list no longer results in correct behavior. A ca=
ll of
> +list_for_each() on ``stey`` results in an infinite loop, as it never ret=
urns
> +back to the ``stey`` list head.
> +
> +This is because list_splice() did not reinitialize the list_head it took
> +entries from, leaving its pointer pointing into what is now a different =
list.
> +
> +If we want to avoid this situation, list_splice_init() can be used. It d=
oes the
> +same thing as list_splice(), except reinitalizes the donor list_head aft=
er the
> +transplant.
> +
> +Concurrency considerations
> +--------------------------
> +
> +Concurrent access and modification of a list needs to be protected with =
a lock
> +in most cases. Alternatively and preferably, one may use the RCU primiti=
ves for
> +lists in read-mostly use-cases, where read accesses to the list are comm=
on but
> +modifications to the list less so. See Documentation/RCU/listRCU.rst for=
 more
> +details.
> +
> +Further reading
> +---------------
> +
> +* `How does the kernel implements Linked Lists? - KernelNewbies <https:/=
/kernelnewbies.org/FAQ/LinkedLists>`_
>=20

The text LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--HLMd7kwOtYwC3JP8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGX3ywAKCRD2uYlJVVFO
oxIqAQDDlzMVSjN3MQvOfwavAGAfAj1GgSP6vRaoEofDsPhamgD+Lz9283aoH1JH
6rs4WpItDiU40V1o0g2b2HtZ/pKpsw4=
=iykP
-----END PGP SIGNATURE-----

--HLMd7kwOtYwC3JP8--

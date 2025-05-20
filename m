Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59954266592;
	Tue, 20 May 2025 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756655; cv=pass; b=Q+9Wo90mULtTHz/kHT7azs5tHfut/i0Una7AOG402xJ2Sk0aB4ik9qTYYLf9pdR3kJT84XRp+95n3XjK1Ch6cXGyJMiPf0c4u46l10uBdJ0NkERxA93I11lkSs5IpPZjtKC05Kactqzd5bDbvolGwYPlhfGqVIFMYcAM3QvLACM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756655; c=relaxed/simple;
	bh=nQI6L7wo6nOQ6itKtFl4U5on3EvuP0P0ORwafgrPHa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcDuLzUp0rYmZrKD65i99sMIghBvY1y1KR+WDOX2ugdcoagzce944C6LXegkxkCyPNhbXzZytRtOiXeibVRfNTCAn4DYASF2w5mkbHSVIG18ymei3uQ7HPy03tbExBnsQZ1K7xBj+8DkqPyDEwJaj1hHp+WeRHUIrEQVSNrUSTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=iGkeNS/4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="iGkeNS/4"
ARC-Seal: i=1; a=rsa-sha256; t=1747756645; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UjGj6C4EDK97NZk7G7C+OQtAEuXMb/0P5aqWC/Y8SQfwYhB6H5JCKu2Pg3esJBAXRswBJeH2mvFINcvmP/aXUfGgdSAEpGc2mU8i0Oh8kth3nbJx3yanj6aLAUAQQ2f7PpxsUB9hjTpDlCYTOgKfSoWlb4ARNOqgopjMH77CsC0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747756645; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VHjk4Bf/QGRzRDkOeyGhCa9baizht500HJklCSaHrQA=; 
	b=KT9sNa3jpiCp9qTNNRFWEtWfGe8IE93Of2lBaXYQXmIv2jRNZqYRWgPpimnWrmAz+XHZXUNyMSyMh2D5FAuf8hy4kRbvP1CMDmbSNEFHY2fG0CV21f+qYmwXqB3TlpO66rRFztuAV5RMf4+Sl7pZg2TyJlW93RSxzxWOFJWC1TM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747756645;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VHjk4Bf/QGRzRDkOeyGhCa9baizht500HJklCSaHrQA=;
	b=iGkeNS/4VjaDS1tP5rANszwnjK3PO20tLczXWps2ac4eQC9uTbURVpcVk33olkWQ
	N1Vxc6cWVYxrGLufwn1QWUAipsT1e7inWUBNNqk/xbexHd84DksDNvsh3kks9/b3MZC
	zEEedC97tcOxBM1ysGdsG4kwQxtm1DCraHz5eGkQ=
Received: by mx.zohomail.com with SMTPS id 1747756644135260.52544976196987;
	Tue, 20 May 2025 08:57:24 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 20 May 2025 17:57:15 +0200
Subject: [PATCH 2/2] docs: document linked lists
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-linked-list-docs-v1-2-db74f7449785@collabora.com>
References: <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
In-Reply-To: <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The kernel contains various generic data structures that should ideally
not be reinvented. However, it often fails to document the usage of
these in the in-tree kernel documentation beyond just a listing of
header symbols in the very lengthy kernel-api docs page. This is fine
for things that have simple invocations, but occasionally things devolve
into several layers of concatenating macros, which are subpar for humans
to parse.

Begin making a small impact by adding some rudimentary example-driven
documentation for the linked list type. It's far from exhaustive, as
many list modification functions are currently not mentioned. However,
it covers the basics and directs readers towards further documentation
should they be interested in concurrency.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/core-api/index.rst |   1 +
 Documentation/core-api/list.rst  | 390 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 391 insertions(+)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index e9789bd381d8048364b2f679bb668f503f8780ec..5723432593f46144dbc4c0232086649bab05f24b 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -54,6 +54,7 @@ Library functionality that is used throughout the kernel.
    union_find
    min_heap
    parser
+   list
 
 Low level entry and exit
 ========================
diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
new file mode 100644
index 0000000000000000000000000000000000000000..1c7375a52afaf884418c4ea2b64d4d0bb6b79d9d
--- /dev/null
+++ b/Documentation/core-api/list.rst
@@ -0,0 +1,390 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=====================
+Linked Lists in Linux
+=====================
+
+:Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+
+.. contents::
+
+Introduction
+============
+
+Linked lists are one of the most basic data structures used in many programs.
+The Linux kernel implements several different flavours of linked lists. The
+purpose of this document is not to explain linked lists in general, but to show
+new kernel developers how to use the Linux kernel implementations of linked
+lists.
+
+Please note that while linked lists certainly are ubiquitous, they may not
+always be the best data structure to use in cases where a simple array doesn't
+already suffice. Familiarizing oneself with other in-kernel generic data
+structures, especially for concurrent accesses, is highly encouraged.
+
+Linux implementation of doubly linked lists
+===========================================
+
+Linux's linked list implementations can be used by including the header file
+``<linux/list.h>``.
+
+The doubly-linked list will likely be the most familiar to many readers. It's a
+list that can efficiently be traversed forwards and backwards.
+
+The Linux kernel's doubly-linked list is circular in nature. This means that to
+get from the head node to the tail, we can just travel one edge backwards.
+Similarly, to get from the tail node to the head, we can simply travel forwards
+"beyond" the tail and arrive back at the head.
+
+Declaring a node
+----------------
+
+A node in a doubly-linked list is declared by adding a ``struct list_head``
+member to the struct you wish to be contained in the list:
+
+.. code-block:: c
+
+  struct clown {
+          unsigned long long shoe_size;
+          const char *name;
+          struct list_head node;  /* the aforementioned member */
+  };
+
+This may be an unfamiliar approach to some, as the classical explanation of a
+linked list is a list node struct with pointers to the previous and next list
+node, as well the payload data. Linux chooses this approach because it allows
+for generic list modification code regardless of what data struct is contained
+within the list. Since the ``struct list_head`` member is not a pointer but part
+of the struct proper, the ``container_of`` pattern can be used by the list
+implementation to access the payload data regardless of its type, while staying
+oblivious to what said type actually is.
+
+Declaring and initializing a list
+---------------------------------
+
+A doubly-linked list can then be declared as just another ``struct list_head``,
+and initialised with the LIST_HEAD_INIT() macro during initial assignment, or
+with the INIT_LIST_HEAD() function later:
+
+.. code-block:: c
+
+  struct clown_car {
+          int tyre_pressure[4];
+          struct list_head clowns;        /* Looks like a node! */
+  };
+
+  /* ... Somewhere later in our driver ... */
+
+  static int circus_init(struct circus_priv *circus)
+  {
+          struct clown_car other_car = {
+                .tyre_pressure = {10, 12, 11, 9},
+                .clowns = LIST_HEAD_INIT(other_car.clowns)
+          };
+
+          circus->car.clowns = INIT_LIST_HEAD(&circus->car.clowns);
+
+          return 0;
+  }
+
+A further point of confusion to some may be that the list itself doesn't really
+have its own type. The concept of the entire linked list and a
+``struct list_head`` member that points to other entries in the list are one and
+the same.
+
+Adding nodes to the list
+------------------------
+
+Adding a node to the linked list is done through the list_add() function.
+
+We'll return to our clown car example to illustrate how nodes get added to the
+list:
+
+.. code-block:: c
+
+  static int circus_fill_car(struct circus_priv *circus)
+  {
+          struct clown_car *car = &circus->car;
+          struct clown *grock;
+          struct clown *dimitri;
+
+          /* State 1 */
+
+          grock = kzalloc(sizeof(*grock), GFP_KERNEL);
+          if (!grock)
+                  return -ENOMEM;
+          grock->name = "Grock";
+          grock->shoe_size = 1000;
+
+          /* Note that we're adding the "node" member */
+          list_add(&grock->node, &car->clowns);
+
+          /* State 2 */
+
+          dimitri = kzalloc(sizeof(*dimitri), GFP_KERNEL);
+          if (!dimitri)
+                  return -ENOMEM;
+          dimitri->name = "Dimitri";
+          dimitri->shoe_size = 50;
+
+          list_add(&dimitri->node, &car->clowns);
+
+          /* State 3 */
+
+          return 0;
+  }
+
+In State 1, our list of clowns is still empty:
+
+.. kernel-render:: DOT
+   :alt: Visualization of clowns list in State 1
+   :caption: clowns list in State 1, grey dashed lines are "prev" edges
+
+   digraph c {
+    rankdir="LR";
+    node [shape=box];
+    "clowns" -> "clowns";
+    "clowns" -> "clowns" [color=gray, style=dashed, constraint=false, arrowsize=0.5];
+   }
+
+In State 2, we've added Grock after the list head:
+
+.. kernel-render:: DOT
+   :alt: Visualization of clowns list in State 2
+   :caption: clowns list in State 2, grey dashed lines are "prev" edges
+
+   digraph c {
+    rankdir="LR";
+    node [shape=box];
+    "clowns" -> "Grock";
+    "Grock" -> "clowns" [constraint=false];
+    "clowns" -> "Grock" -> "clowns" [color=gray, style=dashed, constraint=false,
+                                     arrowsize=0.5];
+   }
+
+In State 3, we've added Dimitri after the list head, resulting in the following:
+
+.. kernel-render:: DOT
+   :alt: Visualization of clowns list in State 3
+   :caption: clowns list in State 3, grey dashed lines are "prev" edges
+
+   digraph c {
+    rankdir="LR";
+    node [shape=box];
+    "clowns" -> "Dimitri" -> "Grock";
+    "Grock" -> "clowns" [constraint=false];
+    "clowns" -> "Grock" -> "Dimitri" -> "clowns" [color=gray, style=dashed,
+                                                  constraint=false, arrowsize=0.5];
+   }
+
+If we wanted to have Dimitri inserted at the end of the list instead, we'd use
+list_add_tail(). Our code would then look like this:
+
+.. code-block:: c
+
+  static int circus_fill_car(struct circus_priv *circus)
+  {
+          /* ... */
+
+          list_add_tail(&dimitri->node, &car->clowns);
+
+          /* State 3b */
+
+          return 0;
+  }
+
+This results in the following list:
+
+.. kernel-render:: DOT
+   :alt: Visualization of clowns list in State 3b
+   :caption: clowns list in State 3b, grey dashed lines are "prev" edges
+
+   digraph c {
+    rankdir="LR";
+    node [shape=box];
+    "clowns" -> "Grock" -> "Dimitri";
+    "Dimitri" -> "clowns" [constraint=false];
+    "clowns" -> "Dimitri" -> "Grock" -> "clowns" [color=gray, style=dashed,
+                                                  constraint=false, arrowsize=0.5];
+   }
+
+Traversing the list
+-------------------
+
+To iterate the list, we can loop through all nodes within the list with
+list_for_each().
+
+In our clown example, this results in the following somewhat awkward code:
+
+.. code-block:: c
+
+  static unsigned long long circus_get_max_shoe_size(struct circus_priv *circus)
+  {
+          unsigned long long res = 0;
+          struct clown *e;
+          struct list_head *cur;
+
+          list_for_each(cur, &circus->car.clowns) {
+                  e = list_entry(cur, struct clown, node);
+                  if (e->shoe_size > res)
+                          res = e->shoe_size;
+          }
+
+          return res;
+  }
+
+Note how the additional ``list_entry`` call is a little awkward here. It's only
+there because we're iterating through the ``node`` members, but we really want
+to iterate through the payload, i.e. the ``struct clown`` that contains each
+node's ``struct list_head``. For this reason, there is a second macro:
+list_for_each_entry()
+
+Using it would change our code to something like this:
+
+.. code-block:: c
+
+  static unsigned long long circus_get_max_shoe_size(struct circus_priv *circus)
+  {
+          unsigned long long res = 0;
+          struct clown *e;
+
+          list_for_each_entry(e, &circus->car.clowns, node) {
+                  if (e->shoe_size > res)
+                          res = e->shoe_size;
+          }
+
+          return res;
+  }
+
+This eliminates the need for the ``list_entry`` step, and our loop cursor is now
+of the type of our payload. The macro is given the member name that corresponds
+to the list's ``struct list_head`` within the clown struct so that it can still
+walk the list.
+
+Removing nodes from the list
+----------------------------
+
+The list_del() function can be used to remove entries from the list. It not only
+removes the given entry from the list, but poisons the entry's ``prev`` and
+``next`` pointers, so that unintended use of the entry after removal does not
+go unnoticed.
+
+We can extend our previous example to remove one of the entries:
+
+.. code-block:: c
+
+  static int circus_fill_car(struct circus_priv *circus)
+  {
+          /* ... */
+
+          list_add(&dimitri->node, &car->clowns);
+
+          /* State 3 */
+
+          list_del(&dimitri->node);
+
+          /* State 4 */
+
+          return 0;
+  }
+
+The result of this would be this:
+
+.. kernel-render:: DOT
+   :alt: Visualization of clowns list in State 4
+   :caption: clowns list in State 4, grey dashed lines are "prev" edges. Note
+             how the Dimitri node no longer points to itself.
+
+   digraph c {
+    rankdir="LR";
+    node [shape=box];
+    "Dimitri";
+    "clowns" -> "Grock";
+    "Grock" -> "clowns" [constraint=false];
+    "clowns" -> "Grock" -> "clowns" [color=gray, style=dashed, constraint=false,
+                                     arrowsize=0.5];
+   }
+
+If we wanted to reinitialize the removed node instead to make it point at itself
+again like an empty list head, we can use list_del_init() instead:
+
+.. code-block:: c
+
+  static int circus_fill_car(struct circus_priv *circus)
+  {
+          /* ... */
+
+          list_add(&dimitri->node, &car->clowns);
+
+          /* State 3 */
+
+          list_del_init(&dimitri->node);
+
+          /* State 4b */
+
+          return 0;
+  }
+
+This results in the deleted node pointing to itself again:
+
+.. kernel-render:: DOT
+   :alt: Visualization of clowns list in State 4b
+   :caption: clowns list in State 4b, grey dashed lines are "prev" edges. Note
+             how the Dimitri node points to itself again.
+
+   digraph c {
+    rankdir="LR";
+    node [shape=box];
+    "Dimitri" -> "Dimitri";
+    "Dimitri" -> "Dimitri" [color=gray, style=dashed, constraint=false, arrowsize=0.5];
+    "clowns" -> "Grock";
+    "Grock" -> "clowns" [constraint=false];
+    "clowns" -> "Grock" -> "clowns" [color=gray, style=dashed, constraint=false,
+                                     arrowsize=0.5];
+   }
+
+Traversing whilst removing nodes
+--------------------------------
+
+Deleting entries while we're traversing the list will cause problems if we use
+list_for_each() and list_for_each_entry(), as deleting the current entry would
+modify the ``next`` pointer of it, which means the traversal can't properly
+advance to the next list entry.
+
+There is a solution to this however: list_for_each_safe() and
+list_for_each_entry_safe(). These take an additional parameter of a pointer to
+a ``struct list_head`` to use as temporary storage for the next entry during,
+iteration, solving the issue.
+
+An example of how to use it:
+
+.. code-block:: c
+
+  static void circus_eject_insufficient_clowns(struct circus_priv *circus)
+  {
+          struct clown *e;
+          struct clown *n;      /* temporary storage for safe iteration */
+
+          list_for_each_entry_safe(e, n, &circus->car.clowns, node) {
+                if (e->shoe_size < 500)
+                        list_del(&e->node);
+          }
+  }
+
+Proper memory management (i.e. freeing the deleted node while making sure
+nothing still references it) in this case is left up as an exercise to the
+reader.
+
+Concurrency considerations
+--------------------------
+
+Concurrent access and modification of a list needs to be protected with a lock
+in most cases. Alternatively and preferably, one may use the RCU primitives for
+lists in read-mostly use-cases, where read accesses to the list are common but
+modifications to the list less so. See Documentation/RCU/listRCU.rst for more
+details.
+
+Further reading
+---------------
+
+* `How does the kernel implements Linked Lists? - KernelNewbies <https://kernelnewbies.org/FAQ/LinkedLists>`_

-- 
2.49.0


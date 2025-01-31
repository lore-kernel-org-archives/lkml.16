Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ECB1F3D52
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354573; cv=none; b=mpOjDI/pqsza2NpoB7NFzBlOZ7LRX9gx+8ckRq/I6wbuBHhl4hoKSRCGS+RhmBXD0cb2ZqoWb2osRmXdoc0fuXvqKZafoZVqVtNEYvwLtyzNycosczLD75Ar6inXH1ostWbPqb1d7i0rLnnTW2KSrlPVlawM9dV5oYx+agdwlqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354573; c=relaxed/simple;
	bh=q7P7vUC4Lo8/S17i0ki3vdm/rogv3WheT18UAKqmtHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FVQxBbUkx/b/uZwAzhKUOaiIwwmTggyZjWregT3PKBkREwBBgJ92qmjbEPiBznZTsmoAxr8uSa1wgksfnRtfqwxiZEDfliMGf3acZz4FEF3W834Y48rvWQL9awn8qzAc+7ujhI2WWyu9T2yVmYnMpSBpTQ2TtOe/Iy3nP6Hyfd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pA+VMZjX; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pA+VMZjX"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361efc9d1fso18071255e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738354568; x=1738959368; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TmuV7JC3aJdVpr/b1nlXMeiCUtmbkl3KljBT/j8YOo=;
        b=pA+VMZjX/DUzZyY31w4OfzPq8j9H64U6yUCWP43jfUISFDmYwsPAAF3jz5bEPWj0Vu
         qId7BEZDF2v2xITIWzWtZbGJobO9DhdSxK+jZpmfGIQAR+bHQGGZLh+7jbOe+BVCGG4k
         IGGXd48WarNqofCdMXw5wATUNmVg0F5KF7Fo3VlCsitA/rieyuVfn8qAOoQ5JXyogA1L
         AJVE8KlbPIkGPrW3HjL6j93IT0c5iA+zOFkWbTBM3SIW8weAOomk/axYsSDr+SxwOZ7H
         15h+5B44ifSt95mwRjqUie72tUBVz4LPz7q8wv8+/dYaaWq9K92S+IsdVAJgd48mcFNg
         Kk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354568; x=1738959368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TmuV7JC3aJdVpr/b1nlXMeiCUtmbkl3KljBT/j8YOo=;
        b=OmoxVyPOMFOIkrsIh0ktoXX0IVKcSoJMYQ7hLe5zF5nxsKLcbmgcpWzm3WCLXOzXd1
         E+SyUt4+oxnLNfZFwpmSsD4LKt8fl6074/mkyY47koelZbpjvkghEM33DHJ4j6Qx+x8a
         Lr5xwLdjw1d8uAQz1AD+d9oWAE/3ibFOHY553BQEj3tit/iM9nLDxXvlBdSpJL6q3Vxz
         i3gQG/Cv7JfnIJFRU2Ypa+ww+EboYn7ZDet4+RIIufuFr+s4M4ej9tI/S7cRSYjhJkJc
         Am6AMiPjlj39raoZSpxcB/FqzDErPlqcW6ITsnbeiRZdpkUqQpEnak2VlaHrQoq5inBX
         yF5g==
X-Forwarded-Encrypted: i=1; AJvYcCVHqH/qHzBUgMJY9ZYG1VynCnMopN2qqE8ooHeixtB0ePGi61t/Og7YPWktHYnfn7YbVS8cbOZbK9FaOLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaqW29qLy2/EGN2sEN6R7yGR0Wgi3p22GWStecSRw3ttadoM4m
	LpH2Xh4YFfjiO2bwH8vOEVAPI67l9BxR9rJBIolftiam0HIRceaojhGJuPCagegjv80+6PBvB+A
	9hSO1huB/NXlmXA==
X-Google-Smtp-Source: AGHT+IEJzvb0SGHOShCPeTnu+35rC/sP79usi5CxqHMxNVOKXHryAmI9z3nZm9q6BI8jGejRhG6ZDNo6vpENat0=
X-Received: from wmrn6.prod.google.com ([2002:a05:600c:5006:b0:436:3ea:c491])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ca0:b0:436:f975:29d with SMTP id 5b1f17b1804b1-438dc3a903emr109387895e9.6.1738354568211;
 Fri, 31 Jan 2025 12:16:08 -0800 (PST)
Date: Fri, 31 Jan 2025 20:15:51 +0000
In-Reply-To: <20250131-cursor-between-v6-0-603bdc7d4449@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250131-cursor-between-v6-0-603bdc7d4449@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=19103; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=q7P7vUC4Lo8/S17i0ki3vdm/rogv3WheT18UAKqmtHA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnnS+BGeSAulXSpy6kDXag0nHdb+g/RcaKz9N7q
 vEsZCOZZjWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ50vgQAKCRAEWL7uWMY5
 Rp8CEACtVLw3SUsbEVbq/Qkfov2XvylFSTphZUkYEvCbNCJukcCr4VbX3FGoCXM9/tcQs/jgFsk
 tVV9A4MtM+/nle8taX99LIlcSkeezwS+6UANxUsNsmaEHNnVFeTRAmLzn9mYon7lwL+bAokW+Lr
 y74xilQvSVBP2JCUE9QIac5S3N/SkjcE6DytJURp3lYCrj2IthC81jnuHp83KE+kVIiwonuYKQj
 vzxObDnVv4q7k+hM9F5fsXGIn+U2BDpxBscpqJyGThitWoMCCfh3CYYa5q5xcTHq3YWbFkHPtMm
 I+jBcDxOmpumORnvqLT9w3DrLMzQOOL2xEQGV1WszTSQQCYIbUozRRYRIUnpEdET4mphpC9CBI6
 2Pu0sSTvPVQPMLs8czm6dmqfv5cTEbWi1lJM2stmowmQ3ckOdLifLkJqJa1oTyWk1eSd4b/KDEY
 JCjdsjoRB+zS/jj+eSTet62XVJMPvWuM6ZzefWfBLZ4aqj0OjkyQJH/hcTAKSEGgvOG3pBe1atw
 bER6sLtyEdYIjnHMwhwnasYffWdnssBbLOwaqH1ONXa6fjZ7q9zqxh6blRvbaxcVujGDC/86mCa
 hrk7CjumTBhEd62M17xdVbGskpMRIKqZx9U7ZmTWeXp2KAN+h0PmE6RMhX0MkpL5X4Wvd+9xAVh Y2OxG4tRHQ1L8wg==
X-Mailer: b4 0.13.0
Message-ID: <20250131-cursor-between-v6-2-603bdc7d4449@google.com>
Subject: [PATCH v6 2/2] rust: list: make the cursor point between elements
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

I've been using the linked list cursor for a few different things, and I
find it inconvenient to use because all of the functions have signatures
along the lines of `Self -> Option<Self>`. The root cause of these
signatures is that the cursor points *at* an element, rather than
*between* two elements.

Thus, change the cursor API to point between two elements. This is
inspired by the stdlib linked list (well, really by this guy [1]), which
also uses cursors that point between elements.

The `peek_next` method returns a helper that lets you look at and
optionally remove the element, as one common use-case of cursors is to
iterate a list to look for an element, then remove that element.

For many of the methods, this will reduce how many we need since they
now just need a prev/next method, instead of the current state where you
may end up needing all of curr/prev/next. Also, if we decide to add a
function for splitting a list into two lists at the cursor, then a
cursor that points between elements is exactly what makes the most
sense.

Another advantage is that this means you can now have a cursor into an
empty list.

Link: https://rust-unofficial.github.io/too-many-lists/sixth-cursors-intro.html [1]
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 401 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 347 insertions(+), 54 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 97b3599b7207..239cf74b84f5 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -483,17 +483,21 @@ pub fn push_all_back(&mut self, other: &mut List<T, ID>) {
         other.first = ptr::null_mut();
     }
 
-    /// Returns a cursor to the first element of the list.
-    ///
-    /// If the list is empty, this returns `None`.
-    pub fn cursor_front(&mut self) -> Option<Cursor<'_, T, ID>> {
-        if self.first.is_null() {
-            None
-        } else {
-            Some(Cursor {
-                current: self.first,
-                list: self,
-            })
+    /// Returns a cursor that points before the first element of the list.
+    pub fn cursor_front(&mut self) -> Cursor<'_, T, ID> {
+        // INVARIANT: `self.first` is in this list.
+        Cursor {
+            next: self.first,
+            list: self,
+        }
+    }
+
+    /// Returns a cursor that points after the last element in the list.
+    pub fn cursor_back(&mut self) -> Cursor<'_, T, ID> {
+        // INVARIANT: `next` is allowed to be null.
+        Cursor {
+            next: core::ptr::null_mut(),
+            list: self,
         }
     }
 
@@ -573,69 +577,358 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
 
 /// A cursor into a [`List`].
 ///
+/// A cursor always rests between two elements in the list. This means that a cursor has a previous
+/// and next element, but no current element. It also means that it's possible to have a cursor
+/// into an empty list.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::prelude::*;
+/// use kernel::list::{List, ListArc, ListLinks};
+///
+/// #[pin_data]
+/// struct ListItem {
+///     value: u32,
+///     #[pin]
+///     links: ListLinks,
+/// }
+///
+/// impl ListItem {
+///     fn new(value: u32) -> Result<ListArc<Self>> {
+///         ListArc::pin_init(try_pin_init!(Self {
+///             value,
+///             links <- ListLinks::new(),
+///         }), GFP_KERNEL)
+///     }
+/// }
+///
+/// kernel::list::impl_has_list_links! {
+///     impl HasListLinks<0> for ListItem { self.links }
+/// }
+/// kernel::list::impl_list_arc_safe! {
+///     impl ListArcSafe<0> for ListItem { untracked; }
+/// }
+/// kernel::list::impl_list_item! {
+///     impl ListItem<0> for ListItem { using ListLinks; }
+/// }
+///
+/// // Use a cursor to remove the first element with the given value.
+/// fn remove_first(list: &mut List<ListItem>, value: u32) -> Option<ListArc<ListItem>> {
+///     let mut cursor = list.cursor_front();
+///     while let Some(next) = cursor.peek_next() {
+///         if next.value == value {
+///             return Some(next.remove());
+///         }
+///         cursor.move_next();
+///     }
+///     None
+/// }
+///
+/// // Use a cursor to remove the last element with the given value.
+/// fn remove_last(list: &mut List<ListItem>, value: u32) -> Option<ListArc<ListItem>> {
+///     let mut cursor = list.cursor_back();
+///     while let Some(prev) = cursor.peek_prev() {
+///         if prev.value == value {
+///             return Some(prev.remove());
+///         }
+///         cursor.move_prev();
+///     }
+///     None
+/// }
+///
+/// // Use a cursor to remove all elements with the given value. The removed elements are moved to
+/// // a new list.
+/// fn remove_all(list: &mut List<ListItem>, value: u32) -> List<ListItem> {
+///     let mut out = List::new();
+///     let mut cursor = list.cursor_front();
+///     while let Some(next) = cursor.peek_next() {
+///         if next.value == value {
+///             out.push_back(next.remove());
+///         } else {
+///             cursor.move_next();
+///         }
+///     }
+///     out
+/// }
+///
+/// // Use a cursor to insert a value at a specific index. Returns an error if the index is out of
+/// // bounds.
+/// fn insert_at(list: &mut List<ListItem>, new: ListArc<ListItem>, idx: usize) -> Result {
+///     let mut cursor = list.cursor_front();
+///     for _ in 0..idx {
+///         if !cursor.move_next() {
+///             return Err(EINVAL);
+///         }
+///     }
+///     cursor.insert_next(new);
+///     Ok(())
+/// }
+///
+/// // Merge two sorted lists into a single sorted list.
+/// fn merge_sorted(list: &mut List<ListItem>, merge: List<ListItem>) {
+///     let mut cursor = list.cursor_front();
+///     for to_insert in merge {
+///         while let Some(next) = cursor.peek_next() {
+///             if to_insert.value < next.value {
+///                 break;
+///             }
+///             cursor.move_next();
+///         }
+///         cursor.insert_prev(to_insert);
+///     }
+/// }
+///
+/// let mut list = List::new();
+/// list.push_back(ListItem::new(14)?);
+/// list.push_back(ListItem::new(12)?);
+/// list.push_back(ListItem::new(10)?);
+/// list.push_back(ListItem::new(12)?);
+/// list.push_back(ListItem::new(15)?);
+/// list.push_back(ListItem::new(14)?);
+/// assert_eq!(remove_all(&mut list, 12).iter().count(), 2);
+/// // [14, 10, 15, 14]
+/// assert!(remove_first(&mut list, 14).is_some());
+/// // [10, 15, 14]
+/// insert_at(&mut list, ListItem::new(12)?, 2)?;
+/// // [10, 15, 12, 14]
+/// assert!(remove_last(&mut list, 15).is_some());
+/// // [10, 12, 14]
+///
+/// let mut list2 = List::new();
+/// list2.push_back(ListItem::new(11)?);
+/// list2.push_back(ListItem::new(13)?);
+/// merge_sorted(&mut list, list2);
+///
+/// let mut items = list.into_iter();
+/// assert_eq!(items.next().unwrap().value, 10);
+/// assert_eq!(items.next().unwrap().value, 11);
+/// assert_eq!(items.next().unwrap().value, 12);
+/// assert_eq!(items.next().unwrap().value, 13);
+/// assert_eq!(items.next().unwrap().value, 14);
+/// assert!(items.next().is_none());
+/// # Result::<(), Error>::Ok(())
+/// ```
+///
 /// # Invariants
 ///
-/// The `current` pointer points a value in `list`.
+/// The `next` pointer is null or points a value in `list`.
 pub struct Cursor<'a, T: ?Sized + ListItem<ID>, const ID: u64 = 0> {
-    current: *mut ListLinksFields,
     list: &'a mut List<T, ID>,
+    /// Points at the element after this cursor, or null if the cursor is after the last element.
+    next: *mut ListLinksFields,
 }
 
 impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> Cursor<'a, T, ID> {
-    /// Access the current element of this cursor.
-    pub fn current(&self) -> ArcBorrow<'_, T> {
-        // SAFETY: The `current` pointer points a value in the list.
-        let me = unsafe { T::view_value(ListLinks::from_fields(self.current)) };
-        // SAFETY:
-        // * All values in a list are stored in an `Arc`.
-        // * The value cannot be removed from the list for the duration of the lifetime annotated
-        //   on the returned `ArcBorrow`, because removing it from the list would require mutable
-        //   access to the cursor or the list. However, the `ArcBorrow` holds an immutable borrow
-        //   on the cursor, which in turn holds a mutable borrow on the list, so any such
-        //   mutable access requires first releasing the immutable borrow on the cursor.
-        // * Values in a list never have a `UniqueArc` reference, because the list has a `ListArc`
-        //   reference, and `UniqueArc` references must be unique.
-        unsafe { ArcBorrow::from_raw(me) }
+    /// Returns a pointer to the element before the cursor.
+    ///
+    /// Returns null if there is no element before the cursor.
+    fn prev_ptr(&self) -> *mut ListLinksFields {
+        let mut next = self.next;
+        let first = self.list.first;
+        if next == first {
+            // We are before the first element.
+            return core::ptr::null_mut();
+        }
+
+        if next.is_null() {
+            // We are after the last element, so we need a pointer to the last element, which is
+            // the same as `(*first).prev`.
+            next = first;
+        }
+
+        // SAFETY: `next` can't be null, because then `first` must also be null, but in that case
+        // we would have exited at the `next == first` check. Thus, `next` is an element in the
+        // list, so we can access its `prev` pointer.
+        unsafe { (*next).prev }
     }
 
-    /// Move the cursor to the next element.
-    pub fn next(self) -> Option<Cursor<'a, T, ID>> {
-        // SAFETY: The `current` field is always in a list.
-        let next = unsafe { (*self.current).next };
+    /// Access the element after this cursor.
+    pub fn peek_next(&mut self) -> Option<CursorPeek<'_, 'a, T, true, ID>> {
+        if self.next.is_null() {
+            return None;
+        }
+
+        // INVARIANT:
+        // * We just checked that `self.next` is non-null, so it must be in `self.list`.
+        // * `ptr` is equal to `self.next`.
+        Some(CursorPeek {
+            ptr: self.next,
+            cursor: self,
+        })
+    }
+
+    /// Access the element before this cursor.
+    pub fn peek_prev(&mut self) -> Option<CursorPeek<'_, 'a, T, false, ID>> {
+        let prev = self.prev_ptr();
+
+        if prev.is_null() {
+            return None;
+        }
+
+        // INVARIANT:
+        // * We just checked that `prev` is non-null, so it must be in `self.list`.
+        // * `self.prev_ptr()` never returns `self.next`.
+        Some(CursorPeek {
+            ptr: prev,
+            cursor: self,
+        })
+    }
+
+    /// Move the cursor one element forward.
+    ///
+    /// If the cursor is after the last element, then this call does nothing. This call returns
+    /// `true` if the cursor's position was changed.
+    pub fn move_next(&mut self) -> bool {
+        if self.next.is_null() {
+            return false;
+        }
+
+        // SAFETY: `self.next` is an element in the list and we borrow the list mutably, so we can
+        // access the `next` field.
+        let mut next = unsafe { (*self.next).next };
 
         if next == self.list.first {
-            None
-        } else {
-            // INVARIANT: Since `self.current` is in the `list`, its `next` pointer is also in the
-            // `list`.
-            Some(Cursor {
-                current: next,
-                list: self.list,
-            })
+            next = core::ptr::null_mut();
         }
+
+        // INVARIANT: `next` is either null or the next element after an element in the list.
+        self.next = next;
+        true
     }
 
-    /// Move the cursor to the previous element.
-    pub fn prev(self) -> Option<Cursor<'a, T, ID>> {
-        // SAFETY: The `current` field is always in a list.
-        let prev = unsafe { (*self.current).prev };
+    /// Move the cursor one element backwards.
+    ///
+    /// If the cursor is before the first element, then this call does nothing. This call returns
+    /// `true` if the cursor's position was changed.
+    pub fn move_prev(&mut self) -> bool {
+        if self.next == self.list.first {
+            return false;
+        }
+
+        // INVARIANT: `prev_ptr()` always returns a pointer that is null or in the list.
+        self.next = self.prev_ptr();
+        true
+    }
 
-        if self.current == self.list.first {
-            None
+    /// Inserts an element where the cursor is pointing and get a pointer to the new element.
+    fn insert_inner(&mut self, item: ListArc<T, ID>) -> *mut ListLinksFields {
+        let ptr = if self.next.is_null() {
+            self.list.first
         } else {
-            // INVARIANT: Since `self.current` is in the `list`, its `prev` pointer is also in the
-            // `list`.
-            Some(Cursor {
-                current: prev,
-                list: self.list,
-            })
+            self.next
+        };
+        // SAFETY:
+        // * `ptr` is an element in the list or null.
+        // * if `ptr` is null, then `self.list.first` is null so the list is empty.
+        let item = unsafe { self.list.insert_inner(item, ptr) };
+        if self.next == self.list.first {
+            // INVARIANT: We just inserted `item`, so it's a member of list.
+            self.list.first = item;
         }
+        item
+    }
+
+    /// Insert an element at this cursor's location.
+    pub fn insert(self, item: ListArc<T, ID>) {
+        // This is identical to `insert_prev`, but consumes the cursor. This is helpful because it
+        // reduces confusion when the last operation on the cursor is an insertion; in that case,
+        // you just want to insert the element at the cursor, and it is confusing that the call
+        // involves the word prev or next.
+        self.insert_inner(item);
+    }
+
+    /// Inserts an element after this cursor.
+    ///
+    /// After insertion, the new element will be after the cursor.
+    pub fn insert_next(&mut self, item: ListArc<T, ID>) {
+        self.next = self.insert_inner(item);
     }
 
-    /// Remove the current element from the list.
+    /// Inserts an element before this cursor.
+    ///
+    /// After insertion, the new element will be before the cursor.
+    pub fn insert_prev(&mut self, item: ListArc<T, ID>) {
+        self.insert_inner(item);
+    }
+
+    /// Remove the next element from the list.
+    pub fn remove_next(&mut self) -> Option<ListArc<T, ID>> {
+        self.peek_next().map(|v| v.remove())
+    }
+
+    /// Remove the previous element from the list.
+    pub fn remove_prev(&mut self) -> Option<ListArc<T, ID>> {
+        self.peek_prev().map(|v| v.remove())
+    }
+}
+
+/// References the element in the list next to the cursor.
+///
+/// # Invariants
+///
+/// * `ptr` is an element in `self.cursor.list`.
+/// * `ISNEXT == (self.ptr == self.cursor.next)`.
+pub struct CursorPeek<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64> {
+    cursor: &'a mut Cursor<'b, T, ID>,
+    ptr: *mut ListLinksFields,
+}
+
+impl<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64>
+    CursorPeek<'a, 'b, T, ISNEXT, ID>
+{
+    /// Remove the element from the list.
     pub fn remove(self) -> ListArc<T, ID> {
-        // SAFETY: The `current` pointer always points at a member of the list.
-        unsafe { self.list.remove_internal(self.current) }
+        if ISNEXT {
+            self.cursor.move_next();
+        }
+
+        // INVARIANT: `self.ptr` is not equal to `self.cursor.next` due to the above `move_next`
+        // call.
+        // SAFETY: By the type invariants of `Self`, `next` is not null, so `next` is an element of
+        // `self.cursor.list` by the type invariants of `Cursor`.
+        unsafe { self.cursor.list.remove_internal(self.ptr) }
+    }
+
+    /// Access this value as an [`ArcBorrow`].
+    pub fn arc(&self) -> ArcBorrow<'_, T> {
+        // SAFETY: `self.ptr` points at an element in `self.cursor.list`.
+        let me = unsafe { T::view_value(ListLinks::from_fields(self.ptr)) };
+        // SAFETY:
+        // * All values in a list are stored in an `Arc`.
+        // * The value cannot be removed from the list for the duration of the lifetime annotated
+        //   on the returned `ArcBorrow`, because removing it from the list would require mutable
+        //   access to the `CursorPeek`, the `Cursor` or the `List`. However, the `ArcBorrow` holds
+        //   an immutable borrow on the `CursorPeek`, which in turn holds a mutable borrow on the
+        //   `Cursor`, which in turn holds a mutable borrow on the `List`, so any such mutable
+        //   access requires first releasing the immutable borrow on the `CursorPeek`.
+        // * Values in a list never have a `UniqueArc` reference, because the list has a `ListArc`
+        //   reference, and `UniqueArc` references must be unique.
+        unsafe { ArcBorrow::from_raw(me) }
+    }
+}
+
+impl<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64> core::ops::Deref
+    for CursorPeek<'a, 'b, T, ISNEXT, ID>
+{
+    // If you change the `ptr` field to have type `ArcBorrow<'a, T>`, it might seem like you could
+    // get rid of the `CursorPeek::arc` method and change the deref target to `ArcBorrow<'a, T>`.
+    // However, that doesn't work because 'a is too long. You could obtain an `ArcBorrow<'a, T>`
+    // and then call `CursorPeek::remove` without giving up the `ArcBorrow<'a, T>`, which would be
+    // unsound.
+    type Target = T;
+
+    fn deref(&self) -> &T {
+        // SAFETY: `self.ptr` points at an element in `self.cursor.list`.
+        let me = unsafe { T::view_value(ListLinks::from_fields(self.ptr)) };
+
+        // SAFETY: The value cannot be removed from the list for the duration of the lifetime
+        // annotated on the returned `&T`, because removing it from the list would require mutable
+        // access to the `CursorPeek`, the `Cursor` or the `List`. However, the `&T` holds an
+        // immutable borrow on the `CursorPeek`, which in turn holds a mutable borrow on the
+        // `Cursor`, which in turn holds a mutable borrow on the `List`, so any such mutable access
+        // requires first releasing the immutable borrow on the `CursorPeek`.
+        unsafe { &*me }
     }
 }
 

-- 
2.48.1.362.g079036d154-goog


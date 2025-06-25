Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E8A158218;
	Wed, 25 Jun 2025 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879045; cv=pass; b=uhicK0qMaeulHj71Hy1oOujwT91Bvz6rMfe5CNYBOQVfVDB14pOMUNSMOpwlS/ayh1pdJrN+VfY25FolLq02Zn4DV1b76H4lkpxhJdoaVgdJgqNUM47Q6pUTdKhxN1sA1gYRpNeCMe4/MSapqcyVLoVEvW65w9UY5Xxz1agaYk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879045; c=relaxed/simple;
	bh=baQ8lqoDMJrwv2qMYvhMt67Ycn967P+jzd4BkSWTRuE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qxhUk9i2le/GPLOfHFrgAUCVqbdyxbGhWHHHrF6WZ7lMXlJXT92a0+g5DhiLOdztTZKQCeSAVh+tSMGVwE02OzkJflB1YzMCvzjgVjX2+0v/uXyuSdKajw0pKvTpE95F9XyPs3vQf+GnGmbLVBMlNuW+cGGRctSsXN8eFPh0xFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ET9LuHMG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ET9LuHMG"
ARC-Seal: i=1; a=rsa-sha256; t=1750879014; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IupojBcgiuJFEfYbMOO2Yq4WbPyu4PoiSeS/cjsqsvipeh7SwGrXk5aSN9ohUIoazDWxAVpPLMUlIPaRamN1Ci8m2jL7B5Gzr6TEu5HZLOffo4n7nVdjPpDKYL09gBOSjy7UFuqlpKREmbZd6+PM0aDToqoSV6xjnigwQX1O0HE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750879014; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mXp/NJEKK2k9Y06sPTp+De6aiQuPK+J2/l3zBut2c/A=; 
	b=VH4wGgKwym8pq4m/6lwlRAIRVxrYOK4BRK3O7mTPCOC5mbw28US9seDqF+lb4TezwiTGZyIWIsq+aKVnOVNzY7Nn6+cmQwMSwJIfAA3hfl3WveJ8Q3NH6v1oEu4jb72yMc3t61FHEcXP0RBi8H7jvPugvy8t0sbPsrv7KbY5/HU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750879014;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=mXp/NJEKK2k9Y06sPTp+De6aiQuPK+J2/l3zBut2c/A=;
	b=ET9LuHMGh6U8m3sABooFAIdJNWQ8UaCChyGIHCcoqhBj4QcaJqLRL/ohF+0yztuh
	ybdkAK5XoESv6BtyPDQh6Etm1iJEs6FOEAOG/v+TckvV8SXRchvl9UyKRnFolVnIMCg
	7N/tdp/Jh5kZeOl9GN4ly72SJHGvoWQqvz9WUOXQ=
Received: by mx.zohomail.com with SMTPS id 1750879012416705.8054775099233;
	Wed, 25 Jun 2025 12:16:52 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: drm: mm: Add DRM MM Range Allocator abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
Date: Wed, 25 Jun 2025 16:16:36 -0300
Cc: linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7D78A0E7-9CA7-4E04-AD55-11254DF66ED8@collabora.com>
References: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
To: David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hmm, this has an issue

[..]

>=20
> +impl<A: AllocInner<T>, T> Drop for MmInner<A, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: If the MmInner is dropped then all nodes are gone =
(since they hold references),
> +        // so it is safe to tear down the allocator.
> +        unsafe {
> +            bindings::drm_mm_takedown(self.0.get());
> +        }
> +    }
> +}
> +
>=20

Where the docs for drm_mm_takedown states:

/**
* drm_mm_takedown - clean up a drm_mm allocator
* @mm: drm_mm allocator to clean up
*
* Note that it is a bug to call this function on an allocator which is =
not
* clean.
*/
void drm_mm_takedown(struct drm_mm *mm)
{
if (WARN(!drm_mm_clean(mm),
"Memory manager not clean during takedown.\n"))
show_leaks(mm);
}
EXPORT_SYMBOL(drm_mm_takedown);


So perhaps we should remove all nodes before takedown?

This covers the error path, i.e.: something failed somewhere else and =
the allocator is dirty.

=E2=80=94 Daniel=

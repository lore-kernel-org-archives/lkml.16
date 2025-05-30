Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4652367A8;
	Fri, 30 May 2025 20:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636297; cv=none; b=Twi6RyzTcEiSU/ZhnBqo5JScqqgNsVmM8Zp7MRfXtLZneoa2cTVtrxSTVxf9zP6glsU+kyAZKDTEoBWUzOY3IlHOgq8ybPdWfJ161YEBMr/LaUvN9BN+jHhzu2RQ9Ik7wDeadq6Vqxe//ZQg9foiWrNq1nCQNGZqIdVIi4YnTwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636297; c=relaxed/simple;
	bh=49AjdxWn7iqeqTjNiqjBIRJwcJBY/yGfwGX1i4ALquI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CKGxdnG57sJIePUArpeydfes7BlVSFcGuf9Bnawy/tcyEkFBdmtuWTazubdY1yWB0XmN76shyhP5ccAzQO8pEpsUMjajxa+988ADDT2j7xIs5QvgO3wmtfhIIK8igmQgOpFDBglFMNfUGYM0ug6jRErkSHzO2hf0IjY+0seqILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6eA7DOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6eA7DOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C86FC4CEEA;
	Fri, 30 May 2025 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748636296;
	bh=49AjdxWn7iqeqTjNiqjBIRJwcJBY/yGfwGX1i4ALquI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f6eA7DOzTHxxzXZ2hKyRB1ErQau2wshKA0qCRHCVrudHpBNKDvi4aqnYCSqdIh/O/
	 92v5u841WqZrvcCzOzirtr2E2YgctUuxZM9EDbCau/6SHffW2q7zevBOaeej9IoCpB
	 aZG52ljHT7oPaB4jAHnYC7lkJ4nVpPSqf0bX56Zx+mLAGikLbNZrhQ6pPxY340HcCm
	 iExE1VmeRICXK4/PhfLegxrFd0KrDmAoW0ogw9qfA0RhfVrE8vGzUd6ZI0xQQ0nwFV
	 QJzq7L+jnHQpMnbxD5MTybkTWFFRgTMX3+GDKjt/pIZXvJLs9dUMipqhckjSUgXKRD
	 F5IH6sQZqqemQ==
From: SeongJae Park <sj@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	linux-debuggers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-toolchains@vger.kernel.org,
	osandov@osandov.com,
	paulmck@kernel.org,
	sweettea-kernel@dorminy.me,
	liuye@kylinos.cn,
	fweimer@redhat.com
Subject: Re: [PATCH v4] tools/mm: Add script to display page state for a given PID and VADDR
Date: Fri, 30 May 2025 13:18:14 -0700
Message-Id: <20250530201814.52489-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <7867c19d-bd6c-4f8a-a227-1145fa0516d9@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2025 11:18:59 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> 
> 在 2025/5/29 07:42, SeongJae Park 写道:
> > On Wed, 28 May 2025 17:15:43 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> >
> >> From: Ye Liu <liuye@kylinos.cn>
[...]
> >> Output example:
> >> sudo ./show_page_info.py 1 0x7fb3eb1b2000
> >> PID: 1 Comm: systemd mm: 0xffff8d27279f9cc0
> >> Raw: 0017ffffc000416c fffff31105a61b08 fffff31105a63608 ffff8d27121326a8
> >> Raw: 0000000000000000 ffff8d271b9dcc40 0000002500000007 ffff8d2711f12700
> >> User Virtual Address: 0x7fb3eb1b2000
> > This is same to what the user passes as the input.  I think this is not really
> > needed?
> 
> It will be removed in the next version.

Thank you!

> 
> >> Page Address:         0xfffff31106356a00
> >> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
> >>                       PG_private|PG_reported|PG_has_hwpoisoned
> >> Page Size:            4096
> >> Page PFN:             0x18d5a8
> >> Page Physical:        0x18d5a8000
> >> Page Virtual:         0xffff8d274d5a8000
> >> Page Refcount:        37
> >> Page Mapcount:        7
> >> Page Index:           0x0
> >> Page Memcg Data:      0xffff8d2711f12700
> >> Memcg Name:           init.scope
> >> Memcg Path:           /sys/fs/cgroup/memory/init.scope
> > On my setup, above two lines look like below:
> >
> >     Memcg Name:           unknown
> >     Memcg Path:           Unexpected error: 'struct kernfs_node' has no member 'parent'
> >
> > Maybe there are rooms to improve?
> The drgn version needs to be updated.

As I mentioned on the v5 of this patch series, I'd hope this output be easier
to understand that.


Thanks,
SJ

[...]

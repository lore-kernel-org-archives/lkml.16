Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC357224888;
	Fri, 11 Apr 2025 23:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744413737; cv=none; b=AFMBe1pl/ws7KhGrD2FTOYInhMWpoaDYNguiUmJ55yesnMgBd6R7jARBeDd9hO/4/sUGF3XGIa/OexVnmX7MPG0KuHsPTWm+6oy2PMAdoPHfN7LSzSTZTmyKnPNBbd2RNyGzVZje/pXklNUqc5t9uvZjS7YNWoXlzrj32o882sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744413737; c=relaxed/simple;
	bh=Kg4V7JTDbGQ8k0MN6Gx8IDG/j1PmIuvRAb8lOZUi3kA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WPytesGwGkJ6Rp9j4FdV+Pu/Z+0CRX2G9OPP0Y2spD9EYjABMi4aTrWWQCdwcVaVaXob4xFftqtuIXliwjJWtCiTBKs/flwyndF0o1zmSijHAMh71k+kfohsbzu9Vy6T0N7otcqmyDO44mf48RHPazLOMT0YumD3tLxIezn/YPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sfZSCPs9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sfZSCPs9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E981AC4CEE2;
	Fri, 11 Apr 2025 23:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744413736;
	bh=Kg4V7JTDbGQ8k0MN6Gx8IDG/j1PmIuvRAb8lOZUi3kA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sfZSCPs9uLH9N+4F2U4AucI/33ysAyEyY5HRSuFxmSJQ4dDpbvUihY84qfdUqqmwP
	 wsPAL8sdjfDt3QiOfBJl+Xw/39dlYdKfzQFIxnptOIMGaFOKVokafeh0blX9h93u0i
	 N1UNE8G94iVhK2i5sc/h7GFzqdLG4M4lLFBTetZs=
Date: Fri, 11 Apr 2025 16:22:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, gfs2@lists.linux.dev, linux-mm@kvack.org,
 david@redhat.com, osalvador@suse.de, yanjun.zhu@linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-Id: <20250411162215.e7b102cf432e7de885b0eec7@linux-foundation.org>
In-Reply-To: <CAHc6FU7B5ORy-97OegzZ939MjuZWdBicLjRxj_bYmG3Hm1mKSA@mail.gmail.com>
References: <20250410035717.473207-1-bhe@redhat.com>
	<20250410035717.473207-2-bhe@redhat.com>
	<20250410204338.4b2101afdf18d8898390ef58@linux-foundation.org>
	<Z/ipfCofBe99Ie+7@MiWiFi-R3L-srv>
	<CAHc6FU7B5ORy-97OegzZ939MjuZWdBicLjRxj_bYmG3Hm1mKSA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Apr 2025 17:07:32 +0200 Andreas Gruenbacher <agruenba@redhat.com> wrote:

> Can this fix please be sent to Linus for inclusion into 6.15?

Sure, I made the adjustments.

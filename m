Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E764A21
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918594; cv=none; b=UP05MjTbeT1A7Xp2LbE0PSdYpJ31YD3vHmuQoEyrGQ5IMSIcarmY04srM4HYwtU1Sp6hMiGcT+zVVfbKaHJT58jE0btf+eJRSiWMdLYhkzld304mb7YQE0+uBjTOsKgu/DN56aWBy+83hYnMwTofGHEbOKCdA5L8WdHAyc/VhcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918594; c=relaxed/simple;
	bh=+2cGPRIrVD8SvLOeqH9eQ/+WFFo1HAM2HPHEdzfI61k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QT9kFVrVLfbWrr6K3C0wrkvideGo9qqhnf9731tgqh+cCreVHo0gerZpIvN2erq/bVSj7iIF+uARCmt+sxK38czGBZkKWn59a/wuuELB+3dWkwYt8ElQS/lQT1wnTUNRVI+wF0gVX6o4cW4HkZIDrOc9HLmliKfdWQ0yjyLCJIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=afydCzvl; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="afydCzvl"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6D0642E81;
	Tue, 29 Apr 2025 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2cGPRIrVD8SvLOeqH9eQ/+WFFo1HAM2HPHEdzfI61k=;
	b=afydCzvlZHCX4KBGrmWxUCAaohiMB8Z29EkDTIRA8n/F5RGPtvZ1C4MJ8ameuWwbE6YAm0
	sLp8LH3C/r13z6V9ae8XzqD57EaZEp8fRW7oMCMhuHEhI5QcSO+txJQpdgqsRpAhkE+6nG
	bcVkcRjxWCSZLdQ8PzoKa1Hcyt6G4CJj0AFEK0QF3bdl/4ygpeDGk5syq7km5x2He8Aa1Y
	DeVELxVU4M29fV7o6dYUvzK+yV59pKwx+zxL4ngzZDA4Py+6ioCju5j0Gu1c6zjgYtws1C
	bITu68gD/AQgt5t06KFc4Ld/0JOYl6pjMqv4EWHSmczzeiyKlo6ZaSlyIxWuMQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
  linux-mtd@lists.infradead.org,  dri-devel@lists.freedesktop.org,
  intel-gfx@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/12] mtd: core: always create master device
In-Reply-To: <20250326152623.3897204-2-alexander.usyskin@intel.com> (Alexander
	Usyskin's message of "Wed, 26 Mar 2025 17:26:12 +0200")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
	<20250326152623.3897204-2-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 29 Apr 2025 11:23:08 +0200
Message-ID: <87ldrjtj7n.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvl
 hdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On 26/03/2025 at 17:26:12 +02, Alexander Usyskin <alexander.usyskin@intel.c=
om> wrote:

> Create master device without partition when
> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>
> This streamlines device tree and allows to anchor
> runtime power management on master device in all cases.
>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Applied to mtd/next. Thanks!

Miqu=C3=A8l

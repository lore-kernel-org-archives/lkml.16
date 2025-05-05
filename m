Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037EB16EB7C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428230; cv=none; b=anfHD+YhLtV5xlt6GE+OYhZqu29KeYl/QcG62Cg1K7WjTL8Dwtb9/VNeoFtDU5NwL80MGXgasddfkQCHnZGNSP+uih6Uly+RRommdejFKK54nzpDdXR5dvs2u/0qp8ZaP4PrnY1h1cMG17Tq3Hl39Ms+90fvsFihWcz7PPJTK1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428230; c=relaxed/simple;
	bh=/VmOnuh5bHMubxNqiAWhXj8YCH1lo7spVhbc2xWeNIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2YkH3Sri5WW9KIguQqZ5WD85bX8C8Kd8SMxxpLELqxibJ+DhvKFYXrfur6hfXqiaLdHw5DE5sJxVxQffaccBzWts3iqYZpBIP9Sb92ew7vtRNk4ULtHn1ZuttsMCBcsgZvXgEEexgT2RqhrNqedRwo59rG7n3QuewV+U1yrs9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RuKcV9tA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rgjNRZRs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RuKcV9tA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rgjNRZRs"
Date: Mon, 5 May 2025 08:56:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746428226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VmOnuh5bHMubxNqiAWhXj8YCH1lo7spVhbc2xWeNIQ=;
	b=RuKcV9tAKP/G5JxlMYHkDO/nHgsnCswJw3blnr0PFexaz+rcqG6uCwQHIVkhCvb1ZlYv0q
	mJRwQHcnEEnHAvcJke10QH0IZSd3Tj3KkesIWe1yn1/H0HmMW/N/b1Le5CDFRZ0ucw9QRH
	RSfQ3OdtspfHsGcPKFzs3LaVt7kn5YXxV/Voo0z94VGqlc9dQRqQRUG0RLcyiz1Re7yYY4
	mDK0dwVjN9K/7qUif0x1N8LtRbtQtLha2Z5HX5q6Cla7Q2/2fRE0WCYZZdkRCMZ8jNeF/g
	IeiNIZ0DGSNLyRye33cz77ggGZ+4xPVYxUPW853TxNVyqfv0HSvhaymc7oPs+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746428226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VmOnuh5bHMubxNqiAWhXj8YCH1lo7spVhbc2xWeNIQ=;
	b=rgjNRZRs9ZlaHQyjOhwDjJbz3Lb/H19Kofg7SGmqhsTS/iqeJx+6KuoUg9R+UDM5U7m1BI
	pK9H9R30NN8IaTBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH 4/4] Workqueue: add WQ_PERCPU to every alloc_workqueue
 user
Message-ID: <20250505065658.pHJpgrgL@linutronix.de>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
 <20250503082834.49413-5-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250503082834.49413-5-marco.crivellari@suse.com>

On 2025-05-03 10:28:34 [+0200], Marco Crivellari wrote:
> By default, alloc_workqueue() creates bound workqueues
> (i.e., without WQ_UNBOUND).
>=20
> With the introduction of the WQ_PERCPU flag (equivalent
> to !WQ_UNBOUND), any alloc_workqueue() caller that
> doesn=E2=80=99t explicitly specify WQ_UNBOUND must now use WQ_PERCPU.
>=20
> All existing users have been updated accordingly.
>=20
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

You could also update Documentation/core-api/workqueue.rst. You
introduce additional flags and you could note the default if this new
flag is missing.

Sebastian

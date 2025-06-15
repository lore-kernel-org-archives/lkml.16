Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3652E11D0
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 22:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750027310; cv=none; b=YnC02gMiUyaJvBRjACecuB8liqKyYfocXbLAVvH/cUI/Y5ktTmmLaK1pq/8ewLGWHD1YR9Pz0EcL3T3CwqeJD3q2usrxE65ehuXBtsrX6q7xN+n+Nyr37Na1e/uB39mbSHTHNlkxExIm8gq3eo5ze0kVgs7jpc5/NfRZtdcvgt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750027310; c=relaxed/simple;
	bh=nbtGoAgY65vQoQN5GcCbThU4YHnDlwEXCSS1jQUKuQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgZcRtKEEBFepWHLu24pfk2Fd+0JqkU/A62VEdcBT39C1ioYKQ7Z33VCZUpQysHTgZ+Ereen1w7VY0h3Hbht4d8MhHJU1WYw07av/kcypCi2IvdxWDL8g6x1tC64eLqjhdMQ3LZlw5o2+gKenMjSqcHcrn54L6KEgQA5awGacwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=UDTw7nDs; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="UDTw7nDs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=rU+sJj75LqZyqLv3QgPIBtKVHEJplMrWuGpi8BGLfeQ=; b=UDTw7nDs0TUc2e5e
	7IXYaja8d7gvTA5UwHcYrySqTS8jEP5GTsdUNRZFGN9O8CcJLrogzTf71/fDhpXZlCBijRwRvvhxp
	NG9EqycvJONbMkHwTFk8s5xRHO1EJ7ikJ9+ejMfdFyiX6H98UDyQ3FbtXNp466cQ/axmdcPGMMPPr
	id9nhbIfZwKc3Ajnj4RYADEW2SWCVTU0z4DS2mB1217j4qg6RgUfWolL0TxSxwIej49NaJ+isDmHL
	Y0bVbdEu2/eQUTfGKapLb6P/+sos6BqBJnMKqaznmOBEpMJWNXxToI6LAri8QzRpnbkzmAV1jgbSt
	r4bUUdU7JLy6dD8lNg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uQw2l-009kBI-2J;
	Sun, 15 Jun 2025 22:41:39 +0000
Date: Sun, 15 Jun 2025 22:41:39 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: wentong.wu@intel.com, alexander.usyskin@intel.com
Cc: linux-kernel@vger.kernel.org
Subject: Of mei suspend/resume unused irq code
Message-ID: <aE9MIykCS71RFnA5@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 22:39:04 up 49 days,  6:52,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  My scripts noticed that vsc_tp_request_irq() and vsc_tp_free_irq()
were unused, since your:

commit 9b5e045029d8 ("mei: vsc: Don't stop/restart mei device during system suspend/resume")

they were only added just before that one, in the patch that fixes;
so I wondered whether those should be deleted as well?

(I've been doing unused function deleting - but don't normally do
recent ones, so thought I'd ask).

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

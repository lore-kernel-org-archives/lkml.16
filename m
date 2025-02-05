Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D179F5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738715569; cv=none; b=t9l2Vv8Iva1cwBeatqam5hno1MTgOLqphIAO9ivPnEoyxLBwRXedXVu4+lHozzlcCq10demT9No1FFzsE0+bFGo+KCBPIkYz8DVxt4s0NNXAyfr+bn7CXlc0Hy6f34IMDrwdoltyzrIKbIdANtoeLZp4wIKTHKfIALFq0dKxhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738715569; c=relaxed/simple;
	bh=NGScyLiG+BOG+/+LGAuzmF0IMofk4iWH7PTisd83fE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZ8LksIgVrRBm7MGBbfx/mm0QTJaVIfK7p+XmZA4QXyZWSGXGCrEOB1DeG6yw1BRg+S7JgFNGZzYXy2AmyVsVAoFIZ/os5wk7/sqykuPSB/cXWkF1mFG3wVv0J2ohE2RkDf9hT+N9zua0rr/KFHD0RJ4ojeaYisecSZnqW1/hjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=cLHDLD/0; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="cLHDLD/0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=B7Fi+KEya2/y5xhZ1kgI07ct4h3/qI6LDn7oDJM2YdE=; b=cLHDLD/0xMyJQkI5
	K5pfdCggXZN9HST65//KahA/vn5oID8wMoYtD+nSjXQI+QxTb5eSoBmuM5jwUaxP2ngWALNXuIZd6
	SZ88ZI6LuN9X9G22Sk0+XMOxITx48se/7ILxvac0w3U+gP1vz6FNon6KTIyKJJ5udy+HUDMTjMmpd
	HCt5nTHKcy0a0bwvMpLHbnnRr+3jKPS/E6KvXL4mK4Why5rzsUFYW33b/+7dtXCRMluXyIam4IXV1
	tqtbxrzmvVPRTzWtfs3ye7R+7m+ItnyWorPhnNQqiHDs0ClTMX9KJGZ3UBU6y9feEu6ZRVOa7oWUI
	4nCZWCG1nWdP6rgZbA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tfTLR-00Dd0V-0w;
	Wed, 05 Feb 2025 00:32:45 +0000
Date: Wed, 5 Feb 2025 00:32:45 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: max8997 cleanup bug?
Message-ID: <Z6KxrcQz0JsQJ9nP@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 00:25:45 up 272 days, 11:39,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi Lee,
  I noticed that:
   drivers/mfd/max8997-irq.c    max8997_irq_exit
isn't called anywhere and was about to send a deadcode patch,
but I'm thinking it's actually a bug and it should be called.

  Looking at the max8998, it has basically the same function,
and it calls it from an error path in it's max8998_i2c_probe.
There's no equivalent call in max8997's probe.

  To me it looks like it probably goes after the 'err_i2c_haptic:'
label, but I don't know the code and as far as I know I don't
have one of the devices.

  Any thoughts?

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

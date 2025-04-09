Received: from animx.eu.org (tn-76-7-174-50.sta.embarqhsd.net [76.7.174.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42D2459CB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=76.7.174.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217891; cv=none; b=kelmwSYNhObicXGNDrMju898+cqTCBcQ7eu9WH0hEhqPl0ajQSrpNOqJhZGxoiFRBbweMWq6u3vbZ67MsKXlH2Je/HfhxZ6c9FPeS19yijhe4bf5TlhBtqXg+A7iumYe4xIQaJsDK52NBGX2aQX0KK0CNAIBLdrND4atS4pRzjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217891; c=relaxed/simple;
	bh=M6v3QASB0F+h1E0z+kyXnIEXKdwlghY8Yb6rdsOP74I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbTv5WrAg88striPdvHfL+Zi3HztZsrU3Sbed32sZokWvoeJDKmuCxtS0OmTa7yG1IztH4VZ3S+m84YNc/ZHJ53CwXWB1Ca05EPRa5yYGZGD8zeqXvj40HdD07VRuF7YLXiA/+kVmgooq5zrfN6cCRzzmYFhXMQY+MNTLUTbFWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=animx.eu.org; spf=pass smtp.mailfrom=animx.eu.org; arc=none smtp.client-ip=76.7.174.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=animx.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=animx.eu.org
Received: from wakko by animx.eu.org with local 
	id 1u2YkX-0005wT-ML;
	Wed, 09 Apr 2025 12:58:05 -0400
Date: Wed, 9 Apr 2025 12:58:05 -0400
From: Wakko Warner <wakko@animx.eu.org>
To: linux-kernel@vger.kernel.org, airlied@redhat.com
Subject: MGA G200 issue in 6.12 and up
Message-ID: <Z/anHRAx3SQWr+h8@animx.eu.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I decided to upgrade to 6.14 on a system with a Matrox G200 onboard vga
(supermicro X9SCL).

I use this system via the BMC.  When the mgag200 driver loads, the bmc
screen flashes between no signal and the screen.  The rate seems to be about
1 second no signal and 1 second with signal.

6.12 and 6.13 both have this problem.

6.11 does not have this problem.

I have a monitor plugged into the vga port and it doesn't have this problem
on any of the kernels I've tried.  Only the remote connection through the bmc
has this problem.  I have booted the system with and with out the monitor
plugged in, it does not appear to make a difference.

-- 
 Microsoft has beaten Volkswagen's world record.  Volkswagen only created 22
 million bugs.

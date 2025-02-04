Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED1612D758
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738645767; cv=none; b=oHYbYz9aQahefttmvygjL1iEe0HHzXSwP/O+YDYCqGYAGIooGFwx9b61u+ADYcHlGCYVlTjfNWreITnW56FWD3XtZmsOjivtA2C0WAmM63XCyRSFpUk/T8HHAmzpBhg0yaU3jGmCLh2K4wjU3MOlPlUi2dzi0GJUAz++Nq29Y78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738645767; c=relaxed/simple;
	bh=Qaq7Gfo7r6pimoqrQm4ERKHUjFa7Q6K4oDCXrDlyxLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mnP1jSSVFq0hzgg8tH/25Wfos0MVZuurGWgx7VSG5ADwVnDygDPVfaVx7pgS19W9q7P4uX1/W20nRJZ+N95qKK2U1YLLX7XUuOaQDISPBuN+Ta5sMn7GheIzkt0tR1oTHeQbSndufj6eiOWxhftLM+6osMxfCX21i7V81N+izEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=grrvh+8u; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="grrvh+8u"
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.11.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 599B4205721D;
	Mon,  3 Feb 2025 21:09:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 599B4205721D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738645765;
	bh=Qaq7Gfo7r6pimoqrQm4ERKHUjFa7Q6K4oDCXrDlyxLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=grrvh+8uxAaPkA3kq2WbpD1r4+MBWBDnYBAlYDWb1NQx2Njuag5OzAC6Bff3My3Wf
	 /BwW9X4jUFMnJ8WPWrDUeqGMWwVNDL2fSgUZihARY+RiyNAMEIkaNQ+OEGxevb/noC
	 I3/JCnAN3NjPTLGERXgZViale94olOH+IvhFrrIM=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: shyamsaini@linux.microsoft.com
Cc: code@tyhicks.com,
	linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk,
	mcgrof@kernel.org,
	frkaya@linux.microsoft.com,
	vijayb@linux.microsoft.com,
	petr.pavlu@suse.com,
	linux@weissschuh.net
Subject: [RFC] Revert "kernel/params.c: defer most of param_sysfs_init() to late_initcall time"
Date: Mon,  3 Feb 2025 21:09:17 -0800
Message-Id: <20250204050917.1599399-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130225803.321004-1-shyamsaini@linux.microsoft.com>
References: <20250130225803.321004-1-shyamsaini@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Adding more folks as per Luis's suggestion, sorry for the noise.

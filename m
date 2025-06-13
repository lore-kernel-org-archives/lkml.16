Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814E6433A8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782955; cv=none; b=jbiI9RfPZ0Ud2BYtShweRvznSU8V6XhrrzBSrYZ0La6CgfS4qsWOyXR9/u1LgOuX7hGTEZBNoQ9H0oH9hPSvZILXXEcMopgKW2MbA0l8/VlpW9hSyBXj4GOzFQE4et5cdv2VB3U2/SKZE+IZZVitYUgjtht78rRCmeoFRwWmSNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782955; c=relaxed/simple;
	bh=Bk0pghWnCWdBO1NH6y+lDiL+29upUOFZxuYWtspWj8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PQOU3T1ECvBOR65CSC7jj/Swxyyn863XPA8F6sm0NMfYMSnfEDX/p9AWSL+3xPduIV1zflrMSJ6/v+eYNzticbj6pSJ26YRujfNaB3s/B4BYv4jYihKb+RYBUJNQZHqrDEcUEv9eIXL0zGCKIjguddDAWFmjI4jpe/9hcZ2Nvqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 430AC160B58;
	Fri, 13 Jun 2025 02:49:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id B800C60013;
	Fri, 13 Jun 2025 02:49:07 +0000 (UTC)
Date: Thu, 12 Jun 2025 22:49:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-erofs@lists.ozlabs.org
Cc: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Subject: Unused trace event in erofs
Message-ID: <20250612224906.15000244@batman.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B800C60013
X-Stat-Signature: uaoocgjsrjds49dg1urx9xzjnucpez7i
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19dmni3gDNOYbl6Buih8pDWlCcmVoa3n6g=
X-HE-Tag: 1749782947-201819
X-HE-Meta: U2FsdGVkX1+Npnbb2LjhalCEdzBhqg8nBpYAH6nNAKTfYYmARJVFTicOE31+R8LLN0xAMDnEKluS4+g0zXdLpSVrL11sDFrm0ft8zXX9XIx7L3dJz/rr425dPVXnHrUTN0fkL2lyzvgYVKC9sij/YPsj2qZ1pYyArdMcjteIHKoa71jfXcbNqwAAFl85SHi8czMXLA1yWkRQ4n2xbSt/zkjKL0yn7kNLr+XY8mum1jMIbJwbDp8rf9SvGVzq89DlWAZLKIZvRg2OEbEgE7p0hDChYdDXaR83K9m8JgznTq4dLYEea/+2kv/3sNbD6jWWmsVSbh4I/YNxW9cDYWH6qiEoqVSRhJs6aO8se8AB7Mgq0PdUtAqjTlia8zhlyjj0obdTKp5CvMHQs8Tc4RbWMQ==

I have code that will trigger a warning if a trace event is defined but
not used[1]. It gives a list of unused events. Here's what I have for
erofs:

warning: tracepoint 'erofs_destroy_inode' is unused.

Each trace event can take up to around 5K in memory regardless if they
are used or not. Soon there will be warnings when they are defined but
not used. Please remove any unused trace event or at least hide it
under an #ifdef if they are used within configs. I'm planning on adding
these warning in the next merge window.

Thanks,

-- Steve

[1] https://lore.kernel.org/linux-trace-kernel/20250612235827.011358765@goodmis.org/

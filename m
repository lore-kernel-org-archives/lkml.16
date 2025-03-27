Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E601B87C0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081473; cv=none; b=W30/cPKynNQosY+tkSIUS9IeJ/raYycOcm4tLnoPR6z7FF7GNerikM11ZggcaDJdF99YAKfbi3KMXRjOmiagbYh7OFJ0/WxpY09zvn1He3tLCjCQ5BXnOYoQGLX6NCVC/79fIxwHMmDD0g1vAbtxKvnaT8RLcebOVoFYZYbBAYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081473; c=relaxed/simple;
	bh=dHqMFyw0FTT/ygi9jUsoQR2ydsa9Z/6XEvLqX5kIads=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SqypLdlPIKf9rZucybv7eMIurFHRMtV60GHcPc0PpXwXmlEdg8eE1Be1VQx+z6vaFxpFrmc61NRzsH/YTx80di+FS3aeaXn4A9w6X3wO5/tktLj0TKcam2OSo66Co8iACquvO+qBUxjgkzmL7jhrVQHTP5Oayhv6aXskfBu4V4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F03C4CEDD;
	Thu, 27 Mar 2025 13:17:52 +0000 (UTC)
Date: Thu, 27 Mar 2025 09:18:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Jain, Ayush" <ayushjai@amd.com>
Cc: Ayush Jain <Ayush.jain3@amd.com>, warthog9@eaglescrag.net,
 linux-kernel@vger.kernel.org, srikanth.aithal@amd.com,
 kalpana.shetty@amd.com
Subject: Re: [PATCH v3] ktest: Fix Test Failures Due to Missing LOG_FILE
 Directories
Message-ID: <20250327091841.1cc405c7@gandalf.local.home>
In-Reply-To: <f1a7c98a-9aeb-4e58-8d8f-d4e5c0e305d4@amd.com>
References: <20250307043854.2518539-1-Ayush.jain3@amd.com>
	<f1a7c98a-9aeb-4e58-8d8f-d4e5c0e305d4@amd.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 15:46:37 +0530
"Jain, Ayush" <ayushjai@amd.com> wrote:

> Hope you're doing well! Just a quick follow-up on this,
> would appreciate your feedback when you get a chance. Let me know if you
> need anything from me.

Ah sorry, I've been traveling and came back to having the merge window
opened, which put me a bit behind.

I'll take a look at it today.

-- Steve

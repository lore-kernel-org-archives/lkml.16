Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31502BF014
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172565; cv=none; b=KiHntxzKfF1LvPUzHa7LzvK1QKuNw9AVuffB+gRumNAPoj9OpOpDe7vjcxM/k0jx7BuAkkMXfHHncw5X4vV8WJzGnLMWXdVXhP/zyxoYBrv7LgSL61TYqOOie4zzNSfFyqQLNBIeKXM7plhoI5AX/bgtXyNIyEWpxUGugm9tqIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172565; c=relaxed/simple;
	bh=7LXvtIqDXRXmjSb8cSXUxKuzL9sqQ0ECWGiDhhfXp4E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GcklM5FIGlEmy4lR9hzslF8oI5gFcZXyRKJAcFFVfyUMPefFcVIS9/c5WnxWqI+eG3nK+qox7nziI0/zHlRXnf+DPVrz/LYLGWkn/OdLfCUcGcwp+X3We9+7kGfxZ+ncfY3R+LqOXACD0VzmxAWP9VE5KPVF/RlXVuusktbc2nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 883E61A046C;
	Tue, 17 Jun 2025 15:02:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 65FF920036;
	Tue, 17 Jun 2025 15:02:40 +0000 (UTC)
Date: Tue, 17 Jun 2025 11:02:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Artem Sadovnikov <a.sadovnikov@ispras.ru>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] function_graph: Fix off-by-one error in buffer size
Message-ID: <20250617110245.5b68ab97@gandalf.local.home>
In-Reply-To: <20250617110017.2883cba3@gandalf.local.home>
References: <20250617111907.1579-1-a.sadovnikov@ispras.ru>
	<20250617110017.2883cba3@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 65FF920036
X-Rspamd-Server: rspamout08
X-Stat-Signature: uio35j54zfumog13exindtcbwukxa4br
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+m9/ZKSipZ+8ukW5dwMEX9xYWenxMNlCc=
X-HE-Tag: 1750172560-856859
X-HE-Meta: U2FsdGVkX1+3EXfC3PMF5WGbyot8EZgwBXCA1kWcX2CmbKtyOU5doYdCIHkkQBIGtidLLX72C9KmqpJEevNZs7lng7PjxQWMV0OY7i+E8hbbr0ErGZolSu7aK8UIoRynwKFVdZJgoVDf6FIKte0KhZSMg0b9FuZv7V38Ux7A1miUilpmmH2WVQo4d83vGiFVJby9NxqtHkYUhOMsf3fEUfaTmN02OLm0A4A/mDZZDbBxsxCbpANu5uypm164VDbxF6x7c5xsvfJN87cTOcR9kmTJafp8F3Q+1u3PnYdJdu+yn48v5x8aw4SMDufxXAJsyuzF5OH/HY7yECSzXpyCueo9tCQLCgVX1o6GkFDD9RnRsSyQSYjoqTYTc0vdNeTrT4IBYORbO9HE4IBk6xvrevrIHoF72jErGtbTn/IOJtK4KIfud6qWHDUr5BlKQJ6uxPAlJI2HneuIb1fPULS0HOfAHo10hXEZKu4y712UW2I=

On Tue, 17 Jun 2025 11:00:17 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 17 Jun 2025 11:19:06 +0000
> Artem Sadovnikov <a.sadovnikov@ispras.ru> wrote:
> 
> > The comment above buffer mentions sign, 10 bytes width for number and null
> > terminator, but buffer itself isn't large enough to hold that much data.
> > 
> > This is a cosmetic change, since PID cannot be negative, other than -1.  
> 
> Right, where I'll change the subject as that makes it look like this is a
> real bug.

Can your resend and Cc linux-trace-kernel@vger.kernel.org otherwise it will
not get into the patchwork queue.

Rename the Subject to:

 fgraph: Make pid_str size match the comment

Thanks!

-- Steve


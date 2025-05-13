Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E476424EF7B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154310; cv=none; b=udR5R6vuAcN5X1OCP2WxXUMIm/uWDaqEQ5Z9iuaSHx0lA8WwiIhUyrk3A7gl2GR2qyOA3zF6bhZFFfuqeQLrkuZCXUss773V8k0b6nnHO1Fjej6sGYpXk2qyKARCrcVKrMM+l2pqc3cR7W7Ca9javM8Yx3gUj9k+l0BehWjogDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154310; c=relaxed/simple;
	bh=M4mG347dfmKDyfjHR0cxgNcIQhUgz0u5DDsbeFAqdi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z05ugaPWkvt00U+ZiPyL51FxyWqIU3yt6W8WR2At2fOyrDbqYpllyHt2GXHbCMQXm/CUShTFZj+woSVX71Uhb7XtkOTb19wkS7RWfTVCh8GYheiFlShSkcp02hdRcqhvoJjvD6yGKaIDDit/DVJuFewqAEOpty1eE+xU89YTqe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7845C4CEE4;
	Tue, 13 May 2025 16:38:29 +0000 (UTC)
Date: Tue, 13 May 2025 12:38:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "contact@linuxplumbersconf.org" <contact@linuxplumbersconf.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Linux Plumbers 2025 Call for Microconferences
Message-ID: <20250513123854.653b9684@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

It's that time of year again, where the summer birds start arriving
back up north and the streets are filled with construction cones. But
the biggest sign of Spring is that feeling to submit a Microconference
proposal for Linux Plumbers!

A Microconference at Linux Plumbers is 3 and a half hours of technical
discussions. It is not for presentations unless the presentation is needed
to help the audience understand the context of what the discussion will be
about. Any presentations should be short and to the point to allow more
time for the discussions. The Microconference is broken up into a series of
topics that last between 15 minutes to a half hour. The goal of these
topics is to brain storm solutions for the issues to be discussed. It is
not necessary to solve the issues during this short period, but to be used
to get everyone on the same page to facilitate collaboration by the normal
means (like mailing lists).

In past years, Microconferences were organized around topics such as
security, scalability, energy efficiency, toolchains, containers,
printing, system boot, Android, scheduling, filesystems, tracing, or
real-time. The LPC Microconference track is open to a wide variety of
topics as long as it is focused, concerned with interesting problems, and
is related to open source and the wider Linux ecosystem. Check out the list
of Microconferences[1] that was presented last year.

The Microconference submission should outline the overall topic and list
of key people who need to attend and problems which may be discussed.

Microconferences that have been at previous LPCs should list results
and accomplishments from those previous sessions in the submission as well
as cover follow-up work and new topics.

Microconference submission can by submitted starting May 10, 2025 here[2].

[1] https://lpc.events/event/18/page/227-microconferences
[2] https://lpc.events/event/19/abstracts/

Looking forward to what is submitted!

Steven Rostedt
Linux Plumbers 2025 Microconference Chair

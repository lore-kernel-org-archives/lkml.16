Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5211917F4;
	Thu,  8 May 2025 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704179; cv=none; b=AiYS1Lvbk735zno4oBuerg2ggkBUQmi2+RS713zOzrThqR+9MhM253om6GyAqesgF08vZmcM3BGVf0C2DhETlqTWfI8XPH7JQFdalmLDA1u4btzBjY5hcz7h2Lu0xUzQzwHgajaUaJo2jqapXDclxGe71OtC3LU7uYc3xDpT/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704179; c=relaxed/simple;
	bh=BU8NQeplfoLhhubiqXdhGOT23Wqj5sJj4znksBSAoxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DfOp/XCN1HQRpx0qfQffDEdCx7XF9dlMzWOC7F0oaEtAks9L7WKfvH0TIk6murY0eiAyGmNZ5gQHHNWuZz0jw7EpFPsfo2JntMlJhxRceowGOqet8tnUbXTHa5ZCT3DmHE9ForyPaFkpfo17nJbpYQCWYJkubyVUr3MQDkBkUxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=JMo5OmnF; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="JMo5OmnF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=C7cZX+eXm/vbJId8kTehe4+vFu6+Xjt+OeRYHMWNqmA=; b=JMo5OmnFRL3WZHIa
	gxoigHirafSLWNb0Y2m/qGorjVcMUVl5+s3BtTEuSN2/iGPsnALVK86HT4Wa5yVsVi62V+LjTCp45
	gYDua7TyOPdSPc2ZvmHnlL9Z2kihLfC075UuGUMKB54Qcf47BOMrXIKkx7W29Q4MMNedMNNiv1pkx
	RMW6eL4sZxRLEmeTa2NVPiIHdQDKW+vFeG70zeSl6Tcos04JLqItFCLTBuPP+AgiaG4qYXNxUmH10
	7M8g2kjRfc//7uxl3sLeVdIwUcfD1fWpaJGzM4QzVJajGaAdtMq/2fns68tLOzfhqJLkwkgJJKAfI
	E6ltcAdqVr6mWIIGfw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uCzXo-002Mu8-2h;
	Thu, 08 May 2025 11:36:04 +0000
Date: Thu, 8 May 2025 11:36:04 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: perex@perex.cz, tiwai@suse.com, krzysztof.h1@wp.pl
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: question on sound/isa/msnd/msnd_midi.c
Message-ID: <aByXJKi2j7B4b0bH@gallifrey>
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
X-Uptime: 11:27:35 up 10 days, 19:41,  1 user,  load average: 0.07, 0.04, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
   I noticed that nothing calls snd_msndmidi_new in
sound/isa/msnd/msnd_midi.c and was about to delete it, but I'm not
too sure - I think it's actually a bug where it should be called.

  This code was added in 2009 by
commit f6c638350275 ("ALSA: Turtle Beach Multisound Classic/Pinnacle driver")
(Pretty new for an ISA card!)

Looking at msnd_midi.c the only function in there that anything
calls is snd_msndmidi_input_read() called by msnd_pinnacle.c but that
is guarded by a check:

  146    if (chip->msndmidi_mpu)
  147          snd_msndmidi_input_read(chip->msndmidi_mpu);   

but I don't think anything sets that msndmidi_mpu, since the only
thing that could is snd_msndmidi_new() which isn't called.

I see that the original poster didn't test the external midi:
   https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWPYLPLJQEK64UU3YFCAMVXGDY42QKF2/
so I guess this has always been missing.

I don't have the hardware to test.

Thoughts?

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

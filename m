Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD626F44C;
	Tue, 29 Apr 2025 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969227; cv=none; b=P18rqBhfXHlEgDeg22pNlJXCBSoHzWA8S5YmusQLWgdgyutC9/jBuFmKsncusZPsT4gzPRGKuvAddOq0rc7WUIgdeDSUzHzMLseLyReRIBcizT5ffi276yBfcw6CpQBhyTgwNAWN8yAO8da+b3b86yFQfJIALFMcPi3XCHut3Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969227; c=relaxed/simple;
	bh=28MtSgjbjXrdZ/jTsaxL32vyuTpnpiiBB72nh4Z88AE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3grbqN7J9vLYiiXK3KbcCliyDDdan7PQKxmsvZvohqib78vkWhbaz7Ep+tWnh8lr1LBUuCKSeP7EW4vsJz7abbQe1+HblNhEMvaRA7s/3OOZyiLnbKB0rYuR/h8gaJaZYJ70UeY3QcmxivOVd5uvSMh9LNkdBHaNH8Cj6yRBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ess5L7vC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ess5L7vC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C87C4CEE3;
	Tue, 29 Apr 2025 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745969226;
	bh=28MtSgjbjXrdZ/jTsaxL32vyuTpnpiiBB72nh4Z88AE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ess5L7vCYQuQNPTszqhQ8yNwaFKuFM7yTi8nS01JB+1uQt/NHg5DISJ7tmQVMFWmI
	 19odnC67quc5WilZYhQWCPm+/RhYU3JM6Luwlh7d3p26T19U4qBssbFqzKo9L0NObQ
	 cPt2iAmVOBS7BXca6dm/qqYP+VGEF7qbtHhY/qbTfxYEy0/aavQXb+aGIVphQUo0yj
	 tPEyn6Ba/DKZgcJpz3sSLajjfvtRwYzdLGOTSBNlknsKRkoGdTFMDhFDLTFOtfBltp
	 RkGGEHjXI2YGLcOr07kp5vLD8Nk4keMydMUjBCm7CDzGl3NkxZWyjEHYI3qQ4GSPDs
	 L4QyZ2zOKMNsQ==
Date: Tue, 29 Apr 2025 16:27:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 04/10] ref_tracker: allow pr_ostream() to print
 directly to a seq_file
Message-ID: <20250429162704.4729a76a@kernel.org>
In-Reply-To: <20250428-reftrack-dbgfs-v5-4-1cbbdf2038bd@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
	<20250428-reftrack-dbgfs-v5-4-1cbbdf2038bd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 11:26:27 -0700 Jeff Layton wrote:
> Allow pr_ostream to also output directly to a seq_file without an
> intermediate buffer.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

lib/ref_tracker.c:316:12: warning: unused function 'ref_tracker_dir_seq_print' [-Wunused-function]
  316 | static int ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~

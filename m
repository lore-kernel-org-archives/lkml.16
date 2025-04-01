Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988CF205E32
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519907; cv=none; b=qdjXaITuq+yXWKUKXVekPpvGF3mC3NEhDPxYQBCsJvxnz836uhT57yz2q46rQBoMDg2ddwiypuiUvJOlKXsoxSwJaFzonhyZhC5/a1AT+E34yIpv3EvqKJrsZwLkVEqxMH+VWik7s6qfGxhysPzJ2rHpXoGtozSrzxN/fIloMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519907; c=relaxed/simple;
	bh=KRgV7yJH945Q5nu3x0ZiSC+43M9bs5mHPyrtYvEUW7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QYS75KKLgKaz8k4PcCeRHGj3DmJ11tcIOS5X8z0BzMZKw4+m93XLpBYecOPQF3k3Mra16yCAFiJE8DJ0pVKjx391GrQgmt+sbSD/4m7AEbG+VDBVyPDkxLh2KEYcg1rBMh3Vt/Wi3gT39lBwE5A1/qxNdy70b0rgjP+wxwTgWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nE6OsoDE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nE6OsoDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB2CC4CEE4;
	Tue,  1 Apr 2025 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743519907;
	bh=KRgV7yJH945Q5nu3x0ZiSC+43M9bs5mHPyrtYvEUW7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nE6OsoDElJSJlzX9Vsj/7LjL0iPhy1OliuuDGUDFixP5oEZAEjtFYxUV+edeJg8+i
	 kyfD1kiObZk9fh/D6FNa7Jff6E0dEl0SdxWRIEuBOnPiSJ9pjjx1dJdtS9VdpdJXyu
	 wq12rSlwURBch0HWBRMoWa0OIEoR+9Lr9HxoTdgzotLZY+DFj9lXY+nKiTBy2QS9yS
	 EkHYbb4DhxwGBiEOWh99Z6uo6BsIPit0HUQ6ejoG0oyi2S5jtHSbr/xasjySsK1/z7
	 fQiesMBXbdtnRA1kKNdrQK9j6iPqj6RlDhg+KJcf6ol+JAVXwBLgfc2T8a5sxfXhAE
	 C3iWfqulultUA==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 0/4] drm/panel: Panel Refcounting infrastructure
Date: Tue,  1 Apr 2025 17:05:02 +0200
Message-ID: <174351989816.2705096.7881070574042680174.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 31 Mar 2025 11:15:24 -0400, Anusha Srivatsa wrote:
> This series adds the infrastructure needed for the refcounting
> allocations for panels similar to Luca's efforts with bridges.
> Underlying intention and idea is the same - avoid use-after-free
> situations in panels. Get reference to panel when in use and put
> the reference back (down) when not in use.
> Once this gets approved, rest of the drivers will have to be
> mass converted to use this API.  All the callers of of_drm_find_panel()
> will have to be converted too.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

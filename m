Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC02188CC9;
	Mon, 23 Jun 2025 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679799; cv=none; b=OBK23N7lB+N9ASKduyeI2TFPIzkJDJBpd6iB20nKAIMRmzkB5LLDOsk6BkkH2oRJfstBRKyrCYAtvT7pOIZquAwtkLVA1kWSBatSJXl7IQKrgMPytPtdlXb9BgubcsTD0G1R++jDFebCCrsaodLnQgiavB4s8XvGTyBcgK+Wo5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679799; c=relaxed/simple;
	bh=AsVQmS7bq9T9Ijg20TqdcrkVwjG2XZOy1DlfOyQadUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7t/ySxOC5RQz0o3FpYspIiXIwDyCX8QD43IJj6yDRFFBlXY9vd0zxvtuB9wsKx3oMIMZ/l2FdVctnfa+V78+ewX9ierpPMCOd0gBPMrK8D6W5ELQRC0YStjc/FkClrKEzLzvDoi+Iq+lVy7jdETKjZnxgOOFXnCgg0z00swTmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYO9Ayvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYO9Ayvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE3FC4CEEA;
	Mon, 23 Jun 2025 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750679799;
	bh=AsVQmS7bq9T9Ijg20TqdcrkVwjG2XZOy1DlfOyQadUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eYO9AyvfD1Fz12Pekiy5r2TdUATUkIEbIktIoz7diA6XFKJlJu0RgwJgEoLbamMe5
	 uHDyeLh7EMagUSkc4xJidI9CDc2mKgPJdzqiiwDTdcyeuWyysODXqx0Ve+H5vcTlfa
	 r3mcsjw1990DowcUvxawUEwz2DIXBPZ0Gj87pHGt5urPD5CzBIfxcpgZCe1vRk1uF9
	 aR++hwdpSEwxqrIiY8cys7+B1aT0RWrADkbY/yCbGt+R+vXhbL7RtHLiwz94OaCGke
	 6CCVGRCfEnwA94MwelBPKOkziRkyuB99y/OvrdaSbsHGZYv4amEk4NDdcGe67Xvoa6
	 F/uJSbFV0k25w==
From: Christian Brauner <brauner@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH] poll: rust: allow poll_table ptrs to be null
Date: Mon, 23 Jun 2025 13:56:27 +0200
Message-ID: <20250623-gigant-luftraum-ff854d561474@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>
References: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=brauner@kernel.org; h=from:subject:message-id; bh=AsVQmS7bq9T9Ijg20TqdcrkVwjG2XZOy1DlfOyQadUk=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWREOnywV3irX9L95ojuXt4t2/OaJ2yPO+Fv+l7L7965W SbP3FYs7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIxgKG/+ELXvxyfhGcUp15 S/OXw36lGT+iPTwr5+ReCZkYZmjF+J3hf3Shv69MluUcY22GKbK5x6LWOH3s6T598cOTrl+Kp2M teAE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 11:49:35 +0000, Alice Ryhl wrote:
> It's possible for a poll_table to be null. This can happen if an
> end-user just wants to know if a resource has events right now without
> registering a waiter for when events become available. Furthermore,
> these null pointers should be handled transparently by the API, so we
> should not change `from_ptr` to return an `Option`. Thus, change
> `PollTable` to wrap a raw pointer rather than use a reference so that
> you can pass null.
> 
> [...]

Applied to the vfs-6.17.rust branch of the vfs/vfs.git tree.
Patches in the vfs-6.17.rust branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.17.rust

[1/1] poll: rust: allow poll_table ptrs to be null
      https://git.kernel.org/vfs/vfs/c/6efbf978891b
